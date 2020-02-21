FROM maven:3.5.2-jdk-9 AS build  
COPY helloworld-mdb /usr/src/app/helloworld-mdb 
COPY pom.xml /usr/src/app  
RUN mvn -f /usr/src/app/pom.xml clean package


FROM jboss/wildfly AS runtime
COPY --from=build /usr/src/app/target/helloworld-mdb.war /opt/jboss/wildfly/standalone/deployments/helloworld-mdb.war  
RUN /opt/jboss/wildfly/bin/add-user.sh admin kubernetes --silent
EXPOSE 8080  
ENTRYPOINT ["/opt/jboss/wildfly/bin/standalone.sh --server-config=standalone-full-ha.xml -b 0.0.0.0 -bmanagement 0.0.0.0"] 
