#
# Build RedHat OpenShift
#

# Apparently SE Linux needs to be enabled in the kernel, but 
# not in the system

class openshift {

exec { 'setenforce 0':
  cwd => '/tmp'
	path=>['/bin','/sbin','/usr/sbin'],
	unless => 'getenforce | grep Permissive'
	}

user {'openshift':
  groups => 'wheel',
  ensure => present
  }

# Why run this all the time?  How do I know I'm up to date?
# Seems yum check-update will return non-zero if there are updates
exec {'yum -y update':
  cwd => '/tmp',
  path=>['/bin','/sbin','/usr/sbin'],
  unless => 'yum check-update'
  }

package {['git','rubygem-rake','ntp']:
  ensure => latest,
  }

exec {'git clone git://github.com/openshift/crankcase.git crankcase':
  cwd => '/tmp',
  unless => 'test -d crankcase',
  path=>['/bin','/usr/bin'],  
  }
->
exec {'rake build_setup':
  cwd => '/tmp/crankcase/build',
  
  }

}
