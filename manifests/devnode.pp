#
# Build RedHat OpenShift
#
class openshift::devnode (
  $broker_ip = '127.0.0.1'
) {

  exec {'rake devnode':
    cwd => '/tmp/crankcase/build',
    path => ['/bin','/usr/bin'],
    unless => 'yum info cartridge-haproxy-1.4 | grep installed'
  }
  ->
  exec {"ss-setup-node --with-broker-ip ${broker_ip} --with-node-ip $::{hostname}":
    cwd => '/tmp',
    path => ['/bin','/usr/bin']
#    unless => '', 
  }
}
