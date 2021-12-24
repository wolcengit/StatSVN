title Maven1
cd %STATSVN_HOME%\demos\maven1
svn update
svn log -v --xml http://svn.apache.org/repos/asf/maven/maven-1/core/ > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 8 -xdoc -concurrency-threshold 2000 -tags "^MAVEN_1_0|^MAVEN_1_0_1|^MAVEN_1_0_2|^maven-1.1-beta-1|^maven-1.1-beta-3" -exclude "**/*.htaccess" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/maven1 -title Maven1 -viewvc  http://svn.apache.org/viewvc/maven/maven-1/core/trunk/  ./svn.log .
svn cleanup
