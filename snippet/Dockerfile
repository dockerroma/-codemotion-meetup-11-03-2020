# Build a JBoss/Wildfy image with custom WAR
FROM jboss/wildfly AS runtime
COPY helloworld-mdb.war /opt/jboss/wildfly/standalone/deployments/helloworld-mdb.war  
COPY configuration.xml /opt/jboss/wildfly/standalone/configuration/configuration.xml
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "--server-config=configuration.xml", "-b", "0.0.0.0"]

