
begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

task :default => 'spec:run'
task 'gem:release' => 'spec:run'

Bones {
  name  'viitelaskuri'
  authors  'Toni Tuominen'
  email    'toni@piranhadigital.fi'
  url      'http://github.com/tjtuom/viitelaskuri'
  ignore_file  '.gitignore'
  depend_on 'rspec', :development => true
}

