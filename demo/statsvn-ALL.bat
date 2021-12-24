:start

call script/statsvn-xmlunit.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-m2plugins.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-maven1.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-testng.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-jdk7.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-commons-lang.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-servicemix.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-jruby.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-jboss.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-xstream.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-jtreemap.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-objectlabkit.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-antunit.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-ant-svn.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-ant-http.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-ant-manual4eclipse.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-ant-dotnet.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-synapse.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-subversion.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-spring-richclient.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-ruby.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-qpid.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-qalab.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-pzfilereader.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-continuum.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-maven2.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-mule.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-log4j.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-groovy-core.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-joda-time.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-hibernate.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-grails.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-ant.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call script/statsvn-felix.bat
cd %STATSVN_HOME%\demo

REM -----------------------------------------------------------------
call maven site

call zipit.bat

call sync-all.bat

rem goto start