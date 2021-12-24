title Ant
cd %STATSVN_HOME%\demos\ant
svn update
svn log -v --xml http://svn.apache.org/repos/asf/ant/core > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 8 -xdoc -concurrency-threshold 2000 -tags "^ANT_11|^ANT_12|^ANT_13|^ANT_14|^ANT_15|^ANT_160|^ANT_170" -exclude "**/*.htaccess" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/ant -title Ant -viewvc  http://svn.apache.org/viewvc/ant/core/trunk/  ./svn.log .
svn cleanup
