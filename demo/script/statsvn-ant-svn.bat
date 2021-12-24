title AntSVN
cd %STATSVN_HOME%\demos\ant-svn
svn update
svn log -v --xml http://svn.apache.org/repos/asf/ant/antlibs/svn > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 8 -xdoc -concurrency-threshold 2000 -exclude "**/*.htaccess" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/ant-svn -title Ant-SVN -viewvc http://svn.apache.org/viewvc/ant/antlibs/svn/trunk/ ./svn.log .
svn cleanup
