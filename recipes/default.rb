#
# Cookbook Name:: ssh
# Recipe:: default
#
# Copyright (C) 2014 Christopher Webber
#

package 'openssh-server'

template '/etc/ssh/sshd_config' do
  action :create
  source 'sshd_config.erb'
  mode 0644
  owner 'root'
  group 'root'
  notifies :restart, 'service[sshd]', :delayed
end

service 'sshd' do
  action [:enable, :start]
end
