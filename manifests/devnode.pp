#
# Build RedHat OpenShift
#
class openshift::devnode {

  exec {'rake devnode':
    cwd => '/tmp/crankcase/build',
    path => ['/bin','/usr/bin'],
    unless => 'yum info cartridge-haproxy-1.4 | grep installed'
  }
   
}
