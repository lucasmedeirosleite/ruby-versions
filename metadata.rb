name              'ruby-versions'
maintainer        'CB3 Tecnologia Criativa'
maintainer_email  'medeiros@cb3.vc'
license           'MIT'
description       'Installs ruby (1.9.3, 2.0.0 or 2.1.0) on the machine'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.0.1'
recipe            'ruby-versions', 'Installs ruby on the machine'

%w{ ubuntu debian }.each do |os|
  supports os
end