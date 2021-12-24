title Grails
cd %STATSVN_HOME%\demos\grails
svn update
svn log -v --xml http://svn.codehaus.org/grails/ > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 15 -config-file %STATSVN_HOME%/script/grails.properties -xdoc -concurrency-threshold 2000 -tags "^GRAILS_RELEASE_0_1|^GRAILS_RELEASE_0_2|^GRAILS_RELEASE_0_3|^GRAILS_RELEASE_0_4|^GRAILS_RELEASE_0_4_1|^GRAILS_RELEASE_0_4_2" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/grails -title Grails -viewvc http://svn.grails.codehaus.org/browse/grails/trunk ./svn.log .
svn cleanup
