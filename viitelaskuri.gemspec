# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{viitelaskuri}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Toni Tuominen"]
  s.date = %q{2010-05-30}
  s.description = %q{A collection of methods for calculating finnish bank references.}
  s.email = %q{toni@piranhadigital.fi}
  s.extra_rdoc_files = ["History.txt", "README.txt", "version.txt"]
  s.files = [".gitignore", "History.txt", "README.txt", "Rakefile", "lib/viitelaskuri.rb", "lib/viitelaskuri/version.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/viitelaskuri_spec.rb", "version.txt", "viitelaskuri.gemspec"]
  s.homepage = %q{http://github.com/tjtuom/viitelaskuri}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{viitelaskuri}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A collection of methods for calculating finnish bank references}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.3.0"])
      s.add_development_dependency(%q<bones>, [">= 3.4.3"])
    else
      s.add_dependency(%q<rspec>, [">= 1.3.0"])
      s.add_dependency(%q<bones>, [">= 3.4.3"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.3.0"])
    s.add_dependency(%q<bones>, [">= 3.4.3"])
  end
end
