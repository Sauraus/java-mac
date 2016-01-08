#
# Cookbook Name:: java-mac
# Recipe:: default
#
# Author: Antek Baranski <antek.baranski@gmail.com>
#
# Copyright 2014 Antek Baranski
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

case node['java-mac']['type']
  when 'JRE'
    dmg_package 'jre-8u66-macosx-x64' do
      app 'Java 8 Update 66'
      type 'pkg'
      source 'http://download.oracle.com/otn-pub/java/jdk/8u66-b17/jre-8u66-macosx-x64.dmg'
      checksum '07b7c4547b03f5e296bd046ce5677e5b5ee967cc7fe5aebdd04f49c52d27b0b2'
      headers node['java-mac']['cookie']
      accept_eula true
      action :install
    end
  when 'JDK'
    dmg_package 'jdk-8u66-macosx-x64' do
      app 'JDK 8 Update 66'
      type 'pkg'
      source 'http://download.oracle.com/otn-pub/java/jdk/8u66-b17/jdk-8u66-macosx-x64.dmg'
      checksum 'cd416de4f41f9f0a6984c456481437681674a717da62259740c54732f174fa08'
      headers node['java-mac']['cookie']
      accept_eula true
      action :install
    end
  else
    raise Chef::Exceptions::AttributeNotFound,
          ("The java-mac cookbook only supports JRE or JDK as the installation types")
end

append_if_no_line "Adding JAVA_HOME to /etc/profile" do
  path "/etc/profile"
  line "export JAVA_HOME=$(/usr/libexec/java_home)"
end
