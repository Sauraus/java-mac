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

header = {'Cookie' => 'oraclelicense=accept-securebackup-cookie'}

case node['java-mac']['type']
  when 'JRE'
    dmg_package 'jre-7u55-macosx-x64' do
      app 'Java 7 Update 55'
      type 'pkg'
      source   'http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jre-7u55-macosx-x64.dmg'
      checksum '9d938abdb8334cd7a2d604b2eb2b8415'
      headers  header
      accept_eula true
      action   :install
    end
  when 'JDK'
    dmg_package 'jdk-7u55-macosx-x64' do
      app 'JDK 7 Update 55'
      type 'pkg'
      source   'http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jdk-7u55-macosx-x64.dmg'
      checksum '2dc4ab3b5d264bb3658d769fee25117d'
      headers  header
      accept_eula true
      action   :install
    end
  else
    raise Chef::Exceptions::AttributeNotFound,
          ("The JAVA Mac OS X cookbook only supports JRE or JDK as the installation types")
end
