# vim:set ft=ldif:
#
version: 1

dn: cn=cesManager,ou=Groups,o=${LDAP_DOMAIN},${OPENLDAP_SUFFIX}
cn: cesManager
description: Members of the cesManager group have full access to the cloudogu administration applications
member: uid=${ADMIN_USERNAME},ou=People,o=${LDAP_DOMAIN},${OPENLDAP_SUFFIX}
member: cn=__dummy
objectClass: top
objectClass: groupOfNames

dn: cn=cesAdmin,ou=Groups,o=${LDAP_DOMAIN},${OPENLDAP_SUFFIX}
cn: cesAdmin
description: This group grants administrative rights to all development applications of cloudogu
member: cn=__dummy
objectClass: top
objectClass: groupOfNames

#dn: cn=cesWrite,ou=Groups,o=${LDAP_DOMAIN},${OPENLDAP_SUFFIX}
#cn: cesWrite
#description: This group grants write permissions to all projects in cloudogu
#member: cn=__dummy
#objectClass: top
#objectClass: groupOfNames

#dn: cn=cesRead,ou=Groups,o=${LDAP_DOMAIN},${OPENLDAP_SUFFIX}
#cn: cesRead
#description: This group grants read access to all projects in cloudogu
#member: cn=__dummy
#objectClass: top
#objectClass: groupOfNames
