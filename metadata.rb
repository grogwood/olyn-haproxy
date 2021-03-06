name 'olyn_haproxy'
maintainer 'Scott Richardson'
maintainer_email 'dev@grogwood.com'
chef_version '~> 16'
license 'GPL-3.0'
supports 'debian', '>= 10'
source_url 'https://gitlab.com/olyn/olyn_haproxy'
description 'Installs and configures the Haproxy load balancer'
version '2.0.2'

provides 'olyn_haproxy::default'
recipe 'olyn_haproxy::default', 'Installs Haproxy load balancer'
