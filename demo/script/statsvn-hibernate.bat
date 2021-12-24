title Hibernate
cd %STATSVN_HOME%\demos\hibernate
svn update
svn log -v --xml http://anonsvn.jboss.org/repos/hibernate > svn.log
java -jar %STATSVN_HOME%\lib\statsvn.jar -threads 25 -xdoc -concurrency-threshold 2000 -tags "^v30final|^v31final|^v32final|^v321|^v322" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/hibernate -title Hibernate3 -viewvc http://viewvc.jboss.org/cgi-bin/viewvc.cgi/hibernate/trunk/Hibernate3 ./svn.log .
svn cleanup
