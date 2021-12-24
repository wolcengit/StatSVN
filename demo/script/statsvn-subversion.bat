title Subversion
cd %STATSVN_HOME%\demos\subversion
svn update
svn log -v --xml https://svn.collab.net/repos/svn > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -tags "^1.0.0|^1.1.0|^1.2.0|^1.3.0|^1.4.0|^1.4.3"  -output-dir %STATSVN_HOME%/site/src/xdocs/subversion -title Subversion -viewvc http://svn.collab.net/viewvc/svn/trunk -threads 15 -xdoc -concurrency-threshold 2000 -verbose ./svn.log .
