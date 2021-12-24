title Ant-Http
cd %STATSVN_HOME%\demos\ant-http
svn update
svn log -v --xml http://svn.apache.org/repos/asf/ant/sandbox/antlibs/http > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 8 -xdoc -concurrency-threshold 2000 -exclude "**/*.htaccess" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/ant-http -title Ant-Http -viewvc http://svn.apache.org/viewvc/ant/sandbox/antlibs/http/trunk ./svn.log .
svn cleanup
