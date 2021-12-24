title JBoss
cd %STATSVN_HOME%\demos\jbossas
svn update
svn log -v --xml http://anonsvn.jboss.org/repos/jbossas > svn.log
java -mx1024m -jar %STATSVN_HOME%\lib\statsvn.jar -threads 18 -xdoc -concurrency-threshold 2000 -tags "^JBoss_5_0_0_Beta1|^JBoss_4_0_5_GA|^JBoss_4_0_4_GA|^JBoss_4_0_3|^JBoss_3_2_8|^JBoss_3_2_7|^JBoss_3_2_6|^JBoss_3_2_0|^JBoss_3_0_0|^JBoss_2_4_0" -exclude "**/*.htaccess" -verbose -output-dir %STATSVN_HOME%/site/src/xdocs/jbossas -title JBoss-AS -viewvc http://viewvc.jboss.org/cgi-bin/viewvc.cgi/jbossas/trunk ./svn.log .
svn cleanup
