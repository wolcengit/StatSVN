title Ruby
cd %STATSVN_HOME%\demos\ruby
svn update
svn log -v --xml http://svn.ruby-lang.org/repos/ruby/ > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 25 -xdoc -concurrency-threshold 2000 -tags "^v1_0|^v1_1|^v1_2_1|^v1_3_1_|^v1_4_0|^v1_5_0|^v1_6_0|^v1_7_1|^v1_8_0|^v1_8_6" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/ruby  -title RUBY -viewvc http://svn.ruby-lang.org/cgi-bin/viewvc.cgi/trunk/ ./svn.log .
