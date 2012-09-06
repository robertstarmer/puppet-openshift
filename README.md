Install Multi-Node OpenShift
============================

This work is based on Krishna Raman's RedHat post:
https://openshift.redhat.com/community/wiki/build-multi-node-paas-from-scratch
http://www.krishnaraman.net/multi-node-openshift-origin-from-scratch/

Step 1.
-------

Install a baseline Fedora16 image.  This likely won't work against Fedora17 due to incompatible ruby installations.

Then:

  yum -y install curl
  bash < <(curl -s -k -B https://raw.github.com/robertstarmer/puppet-openshift/master/build_openshift)

After which you should snapshot the image, and replicate for your additional PaaS nodes.

Usage
-----

Add to your puppet master modules

create a broker definition:

node /broker/ {

  class{openshift::broker:
  }

}

node /openshfit-node/ {

  class {openshift::node:
  }

}