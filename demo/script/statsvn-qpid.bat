title QPid
cd %STATSVN_HOME%\demos\qpid
svn update
svn log -v --xml http://svn.apache.org/repos/asf/incubator/qpid > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 5 -xdoc -concurrency-threshold 2000 -tags "^M1|^pre-M1" -output-dir %STATSVN_HOME%/site/src/xdocs/qpid -title QPid -exclude "**/qalab.xml" -viewvc http://svn.apache.org/viewvc/incubator/qpid/trunk ./svn.log .
svn cleanup
