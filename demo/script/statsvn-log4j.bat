title Log4j
cd %STATSVN_HOME%\demos\log4j
svn update
svn log -v --xml http://svn.apache.org/repos/asf/logging/log4j > svn.log
java -jar %STATSVN_HOME%\lib\statsvn.jar -xdoc -threads 5 -xdoc -concurrency-threshold 2000 -tags "^v1_2_9|^v1_2_10recalled|^v1_2_11|^v1_2_12|^v1_2_13|^v1_2_14|^v1_3alpha_6" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/log4j -title Log4J -viewvc http://svn.apache.org/viewvc/logging/log4j/trunk/ ./svn.log .
