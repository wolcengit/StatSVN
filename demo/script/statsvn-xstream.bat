title XStream
cd %STATSVN_HOME%\demos\xstream
svn update
svn log -v --xml http://svn.codehaus.org/xstream > svn.log
java -mx512m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 8 -xdoc -concurrency-threshold 2000 -tags "^XSTREAM_0_2|^XSTREAM_0_3|^XSTREAM_0_4|^XSTREAM_0_5|^XSTREAM_0_6|^XSTREAM_1_0_1|^XSTREAM_1_1|^XSTREAM_1_2|^XSTREAM_1_2_1" -exclude "**/*.htaccess" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/xstream -title XStream -viewvc http://svn.xstream.codehaus.org/browse/xstream/trunk ./svn.log .
svn cleanup
