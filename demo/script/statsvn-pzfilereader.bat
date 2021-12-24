title PZFileReader
cd %STATSVN_HOME%\demos\pzfilereader
svn update
svn log -v --xml https://pzfilereader.svn.sourceforge.net/svnroot/pzfilereader/ > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 25 -xdoc -config-file %STATSVN_HOME%/script/statsvn.properties -concurrency-threshold 2000 -tags "^release_2.2.0|^Root_v2_0_0|^Root_v1_0_5|^Root_V2_1_0|^Root_V2_2_0_0/" -output-dir %STATSVN_HOME%/site/src/xdocs/pzfilereader  -title PZFileReader -exclude "**/SampleCSV.csv|**/qalab.xml" -viewvc http://pzfilereader.svn.sourceforge.net/viewvc/pzfilereader/trunk ./svn.log .
svn cleanup
