apt_update 'update' do
  action :update
end

package 'openjdk-8-jdk' do
  action :install
end

directory '/opt/jenkins' do
  action :create
  owner 'ubuntu'
  group 'ubuntu'
end

remote_file '/home/ubuntu/chef-workstation_0.17.5-1_amd64.deb' do
  action :create
  source 'https://packages.chef.io/files/stable/chef-workstation/0.17.5/ubuntu/16.04/chef-workstation_0.17.5-1_amd64.deb'
end

dpkg_package 'chef-workstation_0.17.5-1_amd64.deb' do
  action :install
  source '/home/ubuntu/chef-workstation_0.17.5-1_amd64.deb'
end

docker_installation 'default' do
  action :create
end

group 'docker' do
  action :modify
  members 'ubuntu'
  append true
end

