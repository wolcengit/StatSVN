title JRuby
cd %STATSVN_HOME%\demos\jruby
svn update
svn log -v --xml http://svn.codehaus.org/jruby/ > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 18 -xdoc -concurrency-threshold 2000 -tags "^jruby-0_9_1|^jruby-0_9_2|^jruby-0_9_8|^jruby-0_9_0" -exclude "**/*.htaccess" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/jruby -title JRuby -viewvc http://svn.jruby.codehaus.org/browse/jruby/trunk ./svn.log .
svn cleanup
