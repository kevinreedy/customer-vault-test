#
# Cookbook Name:: vault-test
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'chef-vault'

ldap_authtok = chef_vault_item("passwords", "ldap_default")
#puts ldap_authtok.inspect
template '/tmp/sssd.conf' do
  source 'sssd.conf.erb'
  mode '0600'
  owner 'root'
  group 'root'
  variables({
    :ldap_default_authtok => ldap_authtok['ldap_default'],
  })
end
