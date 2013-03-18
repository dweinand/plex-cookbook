#
# Cookbook Name:: plex
# Recipe:: media_center
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

zip_url = node['plex']['media_center']['zip_url']
zip_file = zip_url.split("/")[-1]
zip_cache_path = "#{Chef::Config[:file_cache_path]}/#{zip_file}"

remote_file zip_cache_path do
  source zip_url
  not_if { ::File.directory?("/Applications/Plex.app") }
end

execute "unzip plex" do
  command "unzip #{zip_cache_path}"
  cwd "/Applications"
  not_if { ::File.directory?("/Applications/Plex.app") }
end

directory "#{ENV['HOME']}/Library/LaunchAgents"
cookbook_file "#{ENV['HOME']}/Library/LaunchAgents/com.plexapp.plexmediacenter.plist" do
  backup false
end

service "plexmediacenter" do
  service_name "com.plexapp.plexmediacenter"
  action :start
end