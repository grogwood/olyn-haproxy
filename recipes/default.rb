# Install Haproxy
package 'haproxy' do
  action :install
  options '--force-yes'
end

# Create the configuration file
template '/etc/haproxy/haproxy.cfg' do
  source 'haproxy.cfg.erb'
  mode 0644
  owner 'root'
  group 'root'
  variables(
    http_port_item:        data_bag_item('ports', node[:olyn_haproxy][:frontend][:http][:ports_data_bag_item]),
    https_port_item:       data_bag_item('ports', node[:olyn_haproxy][:frontend][:https][:ports_data_bag_item]),
    backend_port_item:     data_bag_item('ports', node[:olyn_haproxy][:backend][:ports_data_bag_item]),
    local_server:          data_bag_item('servers', node[:hostname]),
    ssl_certificates_item: data_bag_item('ssl_certificates', node[:olyn_haproxy][:frontend][:https][:ssl_certificates_data_bag_item]),
    certificate_id:        node[:olyn_haproxy][:frontend][:https][:certificate_id]
  )
  notifies :restart, 'service[haproxy]', :delayed
end

# Haproxy service
service 'haproxy' do
  supports restart: true
  action :nothing
end
