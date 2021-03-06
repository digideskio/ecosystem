#!/bin/bash
source /etc/ces/functions.sh

# general variables for templates
DOMAIN=$(get_domain)
FQDN=$(get_fqdn)
LDAP_HOST='ldap'
LDAP_PORT=389
LDAP_BASE_DN="ou=People,o=${DOMAIN},dc=cloudogu,dc=com"
LDAP_BIND_DN=$(doguctl config -e sa-ldap/username)
LDAP_BIND_PASSWORD=$(doguctl config -e sa-ldap/password | sed 's@/@\\\\/@g')

# render templates
sed "s@%DOMAIN%@$DOMAIN@g;\
s@%FQDN%@$FQDN@g;\
s@%LDAP_HOST%@$LDAP_HOST@g;\
s@%LDAP_PORT%@$LDAP_PORT@g;\
s@%LDAP_BASE_DN%@$LDAP_BASE_DN@g;\
s@%LDAP_BIND_DN%@$LDAP_BIND_DN@g;\
s@%LDAP_BIND_PASSWORD%@$LDAP_BIND_PASSWORD@g"\
 /resources/cas.properties.tpl > /opt/apache-tomcat/webapps/cas/WEB-INF/cas.properties

# create truststore, which is used in the setenv.sh
create_truststore.sh > /dev/null

# startup tomcat
exec su - cas -c "export JAVA_HOME='/opt/jdk' && ${CATALINA_SH} run"
