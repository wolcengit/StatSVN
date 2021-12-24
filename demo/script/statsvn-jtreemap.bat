title JTreeMap
cd %STATSVN_HOME%\demos\jtreemap
svn update
svn log -v --xml https://jtreemap.svn.sourceforge.net/svnroot/jtreemap/ > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 5 -xdoc -config-file %STATSVN_HOME%/script/statsvn.properties -concurrency-threshold 2000 -tags "^1.0.1|^1.1.0"  -output-dir %STATSVN_HOME%/site/src/xdocs/jtreemap -title JTreeMap -exclude "**/qalab.xml" -viewvc http://jtreemap.svn.sourceforge.net/viewvc/jtreemap/trunk ./svn.log .
svn cleanup
