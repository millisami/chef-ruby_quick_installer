#
# Cookbook Name:: ruby_quick_installer
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

package "python-software-properties"

execute "apt-add-repository -y ppa:brightbox/ruby-ng" do
  not_if "test -t /etc/apt/sources.list.d/brightbox-ruby-ng-#{node['lsb']['codename']}.list"
end

execute "remove tmp list" do
  command "cd /etc/apt/sources.list.d && rm ruby-packaged-source.list && rm ruby-packaged-source.list.save"
  only_if "test -t /etc/apt/sources.list.d/ruby-packaged-source.list"
end

execute "apt-get -y update" do
  not_if "test -f /usr/bin/ruby"
end

execute "apt-get -y install ruby1.9.3" do
  not_if "test -f /usr/bin/ruby"
end
