title JodaTime
cd %STATSVN_HOME%\demos\joda-time
svn update
svn log -v --xml https://svn.sourceforge.net/svnroot/joda-time > svn.log
java -jar %STATSVN_HOME%\lib\statsvn.jar -threads 25 -xdoc -config-file %STATSVN_HOME%/script/joda.properties -concurrency-threshold 2000 -tags "^v0_8_000|^v0_9_000|^v0_9_500|^v0_9_800|^v0_9_900|^v1_0_000|^v1_1_000|^v1_2_000|^v1_3_000|^v1_4_000|^v1_2_001" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/jodatime -title Joda-Time -viewvc http://svn.sourceforge.net/viewvc/joda-time/trunk ./svn.log .
svn cleanup
