package net.sf.statsvn.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.statcvs.util.LookaheadReader;
import net.sf.statsvn.output.SvnConfigurationOptions;

/**
 * Utility class that verifies if the correct version of subversion is used.
 * 
 * @author Jean-Philippe Daigle <jpdaigle@softwareengineering.ca>
 * 
 * @version $Id: SvnStartupUtils.java 394 2009-08-10 20:08:46Z jkealey $
 */
public class SvnStartupUtils implements ISvnVersionProcessor {
	private static final String SVN_VERSION_COMMAND = "svn --version";

	public static final String SVN_MINIMUM_VERSION = "1.3.0";

	public static final String SVN_MINIMUM_VERSION_DIFF_PER_REV = "1.4.0";

	private static final String SVN_VERSION_LINE_PATTERN = ".* [0-9]+\\.[0-9]+\\.[0-9]+.*";

	private static final String SVN_VERSION_PATTERN = "[0-9]+\\.[0-9]+\\.[0-9]+";


    protected ISvnProcessor processor;

    /**
     * Invokes various calls needed during StatSVN's startup, including the svn version command line.   
     */
    public SvnStartupUtils(ISvnProcessor processor) {
        this.processor = processor;
    }

    protected ISvnProcessor getProcessor() {
        return processor;
    }

	/* (non-Javadoc)
     * @see net.sf.statsvn.util.IVersionProcessor#checkSvnVersionSufficient()
     */
	public synchronized String checkSvnVersionSufficient() throws SvnVersionMismatchException {
		ProcessUtils pUtils = null;
		try {

			pUtils = ProcessUtils.call(SVN_VERSION_COMMAND);
			final InputStream istream = pUtils.getInputStream();
			final LookaheadReader reader = new LookaheadReader(new InputStreamReader(istream));

			while (reader.hasNextLine()) {
				final String line = reader.nextLine();
				if (line.matches(SVN_VERSION_LINE_PATTERN)) {
					// We have our version line
					final Pattern pRegex = Pattern.compile(SVN_VERSION_PATTERN);
					final Matcher m = pRegex.matcher(line);
					if (m.find()) {
						final String versionString = line.substring(m.start(), m.end());

						// we perform a simple string comparison against the version numbers
						if (compareVersion(versionString,SVN_MINIMUM_VERSION) >=0) {
							return versionString; // success
						} else {
							throw new SvnVersionMismatchException(versionString, SVN_MINIMUM_VERSION);
						}
					}
				}
			}

			if (pUtils.hasErrorOccured()) {
				throw new IOException(pUtils.getErrorMessage());
			}
		} catch (final IOException e) {
			SvnConfigurationOptions.getTaskLogger().info(e.getMessage());
		} catch (final RuntimeException e) {
			SvnConfigurationOptions.getTaskLogger().info(e.getMessage());
		} finally {
			if (pUtils != null) {
				try {
					pUtils.close();
				} catch (final IOException e) {
					SvnConfigurationOptions.getTaskLogger().info(e.getMessage());
				}
			}
		}

		throw new SvnVersionMismatchException();
	}

	/* (non-Javadoc)
     * @see net.sf.statsvn.util.IVersionProcessor#checkDiffPerRevPossible(java.lang.String)
     */
	public synchronized boolean checkDiffPerRevPossible(final String version) {
		// we perform a simple string comparison against the version numbers
		return compareVersion(version,SVN_MINIMUM_VERSION_DIFF_PER_REV) >= 0;
	}

   /**
     * 比较版本大小
     *
     * 说明：支n位基础版本号+1位子版本号
     * 示例：1.0.2>1.0.1 , 1.0.1.1>1.0.1
     *
     * @param version1 版本1
     * @param version2 版本2
     * @return 0:相同 1:version1大于version2 -1:version1小于version2
     */
    public int compareVersion(String version1, String version2) {
        if (version1.equals(version2)) {
            return 0; //版本相同
        }
        String[] v1Array = version1.split("\\.");
        String[] v2Array = version2.split("\\.");
        int v1Len = v1Array.length;
        int v2Len = v2Array.length;
        int baseLen = 0; //基础版本号位数（取长度小的）
        if(v1Len > v2Len){
            baseLen = v2Len;
        }else{
            baseLen = v1Len;
        }

        for(int i=0;i<baseLen;i++){ //基础版本号比较
            if(v1Array[i].equals(v2Array[i])){ //同位版本号相同
                continue; //比较下一位
            }else{
                return Integer.parseInt(v1Array[i])>Integer.parseInt(v2Array[i]) ? 1 : -1;
            }
        }
        //基础版本相同，再比较子版本号
        if(v1Len != v2Len){
            return v1Len > v2Len ? 1:-1;
        }else {
            //基础版本相同，无子版本号
            return 0;
        }
    }

}
