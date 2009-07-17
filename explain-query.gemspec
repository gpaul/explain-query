# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{explain-query}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gustav Paul"]
  s.date = %q{2009-07-18}
  s.description = %q{ExplainQuery let's you see the output of Mysql's EXPLAIN command from your Rails console.}
  s.email = %q{gustav@rails.co.za}
  s.files = ["History.txt", "README.rdoc", "Rakefile", "Manifest.txt", "lib/explain-query.rb", "lib/explain-query/explain-query.rb", "script/console", "script/destroy", "script/generate", "test/test_helper.rb", "test/test_explain-query.rb"]
  s.has_rdoc = false
  s.homepage = %q{http://github.com/g00k/explain-query}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{explain-query}
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{ExplainQuery let's you see the output of Mysql's EXPLAIN command from your Rails console.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mime-types>, [">= 1.15"])
      s.add_runtime_dependency(%q<diff-lcs>, [">= 1.1.2"])
    else
      s.add_dependency(%q<mime-types>, [">= 1.15"])
      s.add_dependency(%q<diff-lcs>, [">= 1.1.2"])
    end
  else
    s.add_dependency(%q<mime-types>, [">= 1.15"])
    s.add_dependency(%q<diff-lcs>, [">= 1.1.2"])
  end
end
