title JDK7
cd %STATSVN_HOME%\demos\jdk7
svn update --username benoitx --password < jdkpassword.txt
svn log -v --xml https://jdk-jrl-sources.dev.java.net/svn/jdk-jrl-sources/jdk7 > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 18 -xdoc -concurrency-threshold 2000 -exclude "**/*.htaccess" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/jdk7 -title JDK7 -viewvc https://jdk-jrl-sources.dev.java.net/source/browse/jdk-jrl-sources/jdk7/trunk/ ./svn.log .
svn cleanup
