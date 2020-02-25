# Build a JBoss/Wildfy image with custom WAR
FROM jboss/wildfly AS runtime
COPY helloworld-mdb.war /opt/jboss/wildfly/standalone/deployments/helloworld-mdb.war  
RUN /opt/jboss/wildfly/bin/add-user.sh admin kubernetes --silent
EXPOSE 8080  
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "--server-config=standalone-full-ha.xml", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

