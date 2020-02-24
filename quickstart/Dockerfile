# First Massive download of Maven dependencies
FROM maven:3.6-jdk-8 AS pre-build
COPY pom.xml /usr/src/app/pom.xml
COPY helloworld-mdb/pom.xml /usr/src/app/helloworld-mdb/pom.xml
RUN mvn -f /usr/src/app/helloworld-mdb/pom.xml dependency:go-offline

# Compile Source Code
FROM pre-build AS build
COPY helloworld-mdb/src /usr/src/app/helloworld-mdb/src
RUN mvn -f /usr/src/app/helloworld-mdb/pom.xml clean package

# Build a JBoss/Wildfy image with custom WAR
FROM jboss/wildfly AS runtime
COPY --from=build /usr/src/app/helloworld-mdb/target/helloworld-mdb.war /opt/jboss/wildfly/standalone/deployments/helloworld-mdb.war  
RUN /opt/jboss/wildfly/bin/add-user.sh admin kubernetes --silent
EXPOSE 8080  
HEALTHCHECK --start-period=1m --interval=10s --timeout=3s CMD curl -f http://localhost:8080/ || exit 1
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "--server-config=standalone-full-ha.xml", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

