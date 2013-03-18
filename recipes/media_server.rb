#
# Cookbook Name:: plex
# Recipe:: media_server
#
# Copyright 2013, Dan Weinand
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

dmg_package "Plex Media Server" do
  dmg_name node['plex']['media_server']['dmg_url'].split("/")[-1]
  volumes_dir node['plex']['media_server']['dmg_volume']
  source node['plex']['media_server']['dmg_url']
  action :install
end

directory "#{ENV['HOME']}/Library/LaunchAgents"
cookbook_file "#{ENV['HOME']}/Library/LaunchAgents/com.plexapp.plexmediaserver.plist" do
  backup false
end

service "plexmediaserver" do
  service_name "com.plexapp.plexmediaserver"
  action :start
end