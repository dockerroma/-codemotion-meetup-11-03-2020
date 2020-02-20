FROM jboss/wildfly
RUN /opt/jboss/wildfly/bin/add-user.sh admin kubernetes --silent

ADD ./helloworld-mdb.war /opt/jboss/wildfly/standalone/deployments

CMD ["/opt/jboss/wildfly/bin/standalone.sh --server-config=standalone-full-ha.xml", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

