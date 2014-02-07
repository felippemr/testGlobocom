# -*- encoding: utf-8 -*-
# stub: mongoid 1.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "mongoid"
  s.version = "1.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Durran Jordan"]
  s.date = "2010-01-14"
  s.email = "durran@gmail.com"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://mongoid.org"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "ODM framework for MongoDB"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 2.2.2"])
      s.add_runtime_dependency(%q<mongo>, [">= 0.18.2"])
      s.add_runtime_dependency(%q<durran-validatable>, [">= 2.0.1"])
      s.add_runtime_dependency(%q<leshill-will_paginate>, [">= 2.3.11"])
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_development_dependency(%q<mocha>, [">= 0.9.8"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.2.2"])
      s.add_dependency(%q<mongo>, [">= 0.18.2"])
      s.add_dependency(%q<durran-validatable>, [">= 2.0.1"])
      s.add_dependency(%q<leshill-will_paginate>, [">= 2.3.11"])
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<mocha>, [">= 0.9.8"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.2.2"])
    s.add_dependency(%q<mongo>, [">= 0.18.2"])
    s.add_dependency(%q<durran-validatable>, [">= 2.0.1"])
    s.add_dependency(%q<leshill-will_paginate>, [">= 2.3.11"])
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<mocha>, [">= 0.9.8"])
  end
end
