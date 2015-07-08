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
    dmg_package 'jre-7u60-macosx-x64' do
      app 'Java 7 Update 60'
      type 'pkg'
      source 'http://download.oracle.com/otn-pub/java/jdk/7u60-b19/jre-7u60-macosx-x64.dmg'
      checksum '526042a4eba12a7eb3f04237361b2300'
      headers node['java-mac']['cookie']
      accept_eula true
      action :install
    end
  when 'JDK'
    dmg_package 'jdk-7u60-macosx-x64' do
      app 'JDK 7 Update 60'
      type 'pkg'
      source 'http://download.oracle.com/otn-pub/java/jdk/7u60-b19/jdk-7u60-macosx-x64.dmg'
      checksum '2ec232fcec17c3c3fdffa09350e4aac7'
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
