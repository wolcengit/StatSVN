title AntUnit
cd %STATSVN_HOME%\demos\antunit
svn update
svn log -v --xml http://svn.apache.org/repos/asf/ant/antlibs/antunit > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 8 -xdoc -concurrency-threshold 2000 -exclude "**/*.htaccess" -tags "^10|^10_BETA1|^10_BETA2" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/antunit -title AntUnit -viewvc http://svn.apache.org/viewvc/ant/antlibs/antunit/trunk ./svn.log .
svn cleanup
