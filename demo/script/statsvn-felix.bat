title Felix
cd %STATSVN_HOME%\demos\felix
svn update
svn log -v --xml http://svn.apache.org/repos/asf/incubator/felix/ > svn.log
java -mx512m -jar %STATSVN_HOME%/lib\statsvn.jar -threads 5 -xdoc -concurrency-threshold 2000 -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/felix -title FELIX -viewvc http://svn.apache.org/viewvc/incubator/felix/trunk/ ./svn.log .
svn cleanup
