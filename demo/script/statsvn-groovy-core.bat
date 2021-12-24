title Groovy-Core
cd %STATSVN_HOME%\demos\groovy-core
svn update
svn log -v --xml http://svn.codehaus.org/groovy/ > svn.log
java -mx712m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 15 -xdoc -config-file %STATSVN_HOME%/script/groovy.properties -concurrency-threshold 2000 -tags "^GROOVY_1_0" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/groovy-core -title Groovy-Core -viewvc http://svn.groovy.codehaus.org/browse/groovy/trunk ./svn.log .
svn cleanup
