title ObjectLabKit
cd %STATSVN_HOME%\demos\objectlabkit
svn update
svn log -v --xml https://objectlabkit.svn.sourceforge.net/svnroot/objectlabkit/ > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 5 -xdoc -config-file %STATSVN_HOME%/script/statsvn.properties -concurrency-threshold 2000 -tags "^1.0.1|^1.1.0"  -output-dir %STATSVN_HOME%/site/src/xdocs/objectlabkit -title ObjectLabKit -exclude "**/qalab.xml" -viewvc http://objectlabkit.svn.sourceforge.net/viewvc/objectlabkit/trunk ./svn.log .
svn cleanup
