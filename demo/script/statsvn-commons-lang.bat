title Commons-Lang
cd %STATSVN_HOME%\demos\commons-lang
svn update
svn log -v --xml http://svn.apache.org/repos/asf/jakarta/commons/proper/lang/ > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 8 -xdoc -concurrency-threshold 2000 -tags "^LANG_1_0|^LANG_2_0|^LANG_2_1|^LANG_2_2|^LANG_2_3" -exclude "**/*.htaccess" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/commons-lang -title Commons-lang -viewvc http://svn.apache.org/viewvc/jakarta/commons/proper/lang/trunk/ ./svn.log .
svn cleanup
