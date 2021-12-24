title Maven2
cd %STATSVN_HOME%\demos\maven2
svn update
svn log -v --xml http://svn.apache.org/repos/asf/maven/components/ > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 8 -xdoc -concurrency-threshold 2000 -tags "^maven-2.0.1|^maven-2.0|^maven-2.0.5|^maven-2.0.4|^maven-2.0.3" -exclude "**/*.htaccess" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/maven2 -title Maven2 -viewvc  http://svn.apache.org/viewvc/maven/components/trunk/  ./svn.log .
svn cleanup
