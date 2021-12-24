title TestNG
cd %STATSVN_HOME%\demos\testng
svn update
svn log -v --xml http://testng.googlecode.com/svn > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 18 -xdoc -config-file %STATSVN_HOME%/script/testng.properties -concurrency-threshold 2000 -exclude "**/*.htaccess" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/testng -title TestNG -viewvc http://testng.googlecode.com/svn/trunk/ ./svn.log .
svn cleanup
