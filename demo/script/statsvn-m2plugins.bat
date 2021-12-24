title Maven2Plugins
cd %STATSVN_HOME%\demos\m2plugins
svn update
svn log -v --xml http://svn.apache.org/repos/asf/maven/plugins/ > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 8 -xdoc -concurrency-threshold 2000 -exclude "**/*.htaccess" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/m2plugins -title Maven2Plugins -viewvc  http://svn.apache.org/viewvc/maven/plugins/trunk/  ./svn.log .
svn cleanup
