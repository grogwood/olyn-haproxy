# Default host
default[:olyn_haproxy][:host] = '*'

# Frontend HTTP listener info
default[:olyn_haproxy][:frontend][:http][:ports_data_bag_item] = 'haproxy_http'

# Frontend HTTPs listener info
default[:olyn_haproxy][:frontend][:https][:ports_data_bag_item]            = 'haproxy_https'
default[:olyn_haproxy][:frontend][:https][:ssl_certificates_data_bag_item] = 'www'
default[:olyn_haproxy][:frontend][:https][:certificate_id]                 = 'pem'

# Backend info
default[:olyn_haproxy][:backend][:server_name]         = 'webserver'
default[:olyn_haproxy][:backend][:host]                = '127.0.0.1'
default[:olyn_haproxy][:backend][:ports_data_bag_item] = 'varnish'