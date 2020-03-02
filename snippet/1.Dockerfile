# Build a JBoss/Wildfy image with custom WAR
FROM jboss/wildfly AS runtime
COPY helloworld-mdb.war /opt/jboss/wildfly/standalone/deployments/helloworld-mdb.war  
COPY configuration.xml /opt/jboss/wildfly/standalone/configuration/configuration.xml
RUN /opt/jboss/wildfly/bin/add-user.sh admin kubernetes --silent
HEALTHCHECK --start-period=30s --interval=10s --timeout=3s CMD curl -f http://localhost:8080/ || exit 1
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "--server-config=configuration.xml", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

