# Cookbook Name:: dotmatrix
# Recipe:: default
#
# Copyright 2013, Ian Kenney
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "vim"
include_recipe "build-essential"

node[:dotmatrix][:users].each do |user|
  home = File.expand_path("~#{user}")
  git "#{home}/dotmatrix" do
    repository  'git://github.com/hashrocket/dotmatrix'
    action :sync
  end

  bash "install_dotmatrix" do
    cwd "#{home}/dotmatrix"
    user "vagrant"
    group "vagrant"
    environment "HOME" => "/home/vagrant"
    code "bin/install"
  end

  bash "install_vimbundles" do
    cwd "#{home}/dotmatrix"
    user "vagrant"
    group "vagrant"
    environment "HOME" => home
    code "bin/vimbundles.sh"
  end
end
