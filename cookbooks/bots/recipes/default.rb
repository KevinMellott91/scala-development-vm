#
# Cookbook Name:: bots
# Recipe:: default
#
# Author:: Jason Capriotti
#

include_recipe "python::default"
include_recipe "python::pip"

python_pip 'cherrypy' do
  version node['cherrypy']['version']
  action [:install, :upgrade]
end

python_pip 'django' do
  version node['django']['version']
  action [:install, :upgrade]
end

python_pip 'genshi' do
  version node['genshi']['version']
  action [:install, :upgrade]
end


ark 'bots' do
  url node['bots']['url']
  path '/tmp'
  action :put
end

execute 'Run bots setup' do
  cwd '/tmp/bots'
  command "python setup.py install"
end

template '/etc/init.d/bots-webserver' do
  only_if { node['bots']['service']['install'] }
  source 'bots-webserver.erb'
  mode "0755"
  action :create
end

service 'bots-webserver' do
  only_if { node['bots']['service']['install'] }
  action [ :enable, :start ]
end
