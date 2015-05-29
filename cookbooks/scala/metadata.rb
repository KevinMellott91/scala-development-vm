name             "scala"
maintainer       "Kyle Allan"
maintainer_email "kallan@riotgames.com"
license          "Apache 2.0"
description      "Installs/Configures scala"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "2.1.0"

%w{ centos redhat fedora }.each do |os|
  supports os
end

depends "java"
depends "ark"
