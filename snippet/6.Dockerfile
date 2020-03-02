# Compila WAR file
FROM maven:3.6-jdk-8 AS build
COPY pom.xml /usr/src/app/pom.xml
COPY helloworld-mdb /usr/src/app/helloworld-mdb
RUN mvn -f /usr/src/app/helloworld-mdb/pom.xml clean package

# Build a JBoss/Wildfy image with custom WAR
FROM jboss/wildfly AS runtime
COPY --from=build /usr/src/app/helloworld-mdb/target/helloworld-mdb.war /opt/jboss/wildfly/standalone/deployments/helloworld-mdb.war  
RUN /opt/jboss/wildfly/bin/add-user.sh admin kubernetes --silent
HEALTHCHECK --start-period=1m --interval=10s --timeout=3s CMD curl -f http://localhost:8080/ || exit 1
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "--server-config=standalone-full-ha.xml", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
