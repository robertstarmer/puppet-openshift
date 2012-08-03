#
# Build RedHat OpenShift
#
class openshift::broker {

  exec {'rake devbroker':
    cwd => '/tmp/crankcase/build',
    path => ['/bin','/usr/bin'],
    unless => 'yum info cartridge-haproxy-1.4 | grep installed'
  }
  ->  
  exec {'ss-setup-broker':
    cwd => '/tmp',
    path => ['/bin','/usr/bin'],
    unless => 'test -f /etc/rndc.key',
  }
}
