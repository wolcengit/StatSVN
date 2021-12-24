title Ant-Manual4Eclipse
cd %STATSVN_HOME%\demos\ant-manual4eclipse
svn update
svn log -v --xml http://svn.apache.org/repos/asf/ant/sandbox/antlibs/manual4eclipse/ > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 8 -xdoc -concurrency-threshold 2000 -tags "^10|^10_B1|^preview_20041022" -exclude "**/*.htaccess" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/ant-manual4eclipse -title Ant-Manual4Eclipse -viewvc http://svn.apache.org/viewvc/ant/sandbox/antlibs/manual4eclipse/trunk ./svn.log .
svn cleanup
