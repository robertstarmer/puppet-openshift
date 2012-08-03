#
# Build RedHat OpenShift
#
class devnode {

  exec {'git clone git://github.com/openshift/crankcase.git crankcase':
    cwd => '/tmp',
    unless => 'test -d crankcase',
    path=>['/bin','/usr/bin'],  
  }
  ->
  exec {'rake devnode':
    cwd => '/tmp/crankcase/build',
    path => ['/bin','/usr/bin'],
    unless => 'yum info cartridge-haproxy-1.4 | grep installed'
  }
   
}
