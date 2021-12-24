title Continuum
cd %STATSVN_HOME%\demos\continuum
svn update
svn log -v --xml http://svn.apache.org/repos/asf/maven/continuum/ > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 8 -xdoc -concurrency-threshold 2000 -tags "^continuum-1.0|^continuum-1.0.1|^continuum-1.0.2|^continuum-1.0.3" -exclude "**/*.htaccess" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/continuum -title Continuum -viewvc  http://svn.apache.org/viewvc/maven/continuum/trunk/  ./svn.log .
svn cleanup
