# installer
#
class {'openshift': }

class {'openshift::devnode':
  broker_ip => '192.168.25.133',
 }

