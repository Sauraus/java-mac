name             'java-mac'
maintainer       'Antek Baranski'
maintainer_email 'antek.baranski@gmail.com'
license          'Apache 2.0'
description      'Installs and configures JAVA SDK or JRE on OSX'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.1.2'

recipe 'java-mac', 'Installs the JAVA SDK or JRE on OSX'

depends 'dmg'
depends 'line'
