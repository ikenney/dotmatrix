name             "dotmatrix"
maintainer       "Ian Kenney"
maintainer_email "ian.kenney@lostsock.co.uk"
license          "Apache 2.0"
description      "Installs dotmatrix config files/vim addons for a nice rails development environment"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

#%w{debian ubuntu arch redhat centos fedora scientific}.each do |os|
%w{ubuntu}.each do |os|
    supports os
end
