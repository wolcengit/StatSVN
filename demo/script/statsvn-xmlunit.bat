title XMLUnit
cd %STATSVN_HOME%\demos\xmlunit
svn update
svn log -v --xml https://xmlunit.svn.sourceforge.net/svnroot/xmlunit > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 18 -xdoc -config-file %STATSVN_HOME%/script/xmlunit.properties -concurrency-threshold 2000 -tags "^r0_6|^v0_8|^v1_0|^PRE_SVN_MIGRATION" -exclude "**/*.htaccess" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/xmlunit -title xmlUnit -viewvc httphttp://xmlunit.svn.sourceforge.net/viewvc/xmlunit/trunk ./svn.log .
svn cleanup