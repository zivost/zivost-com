# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "jekyll-zivost"
  spec.version       = "0.1.10"
  spec.authors       = ["Rohit Hazra"]
  spec.email         = ["rohit@zivost.com"]

  spec.summary       = %q{Zivost Official Website.}
  spec.homepage      = "https://zivost.com"
  spec.license       = "Unlicense"

  spec.files         = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r!^(assets|_(includes|layouts|sass)/|(LICENSE|README)((\.(txt|md|markdown)|$)))!i)
  end

  spec.platform      = Gem::Platform::RUBY
  spec.add_runtime_dependency "jekyll", "~> 3.9.0"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.8.0"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.4.0"
  spec.add_runtime_dependency "jekyll-tagging", "~> 1.1.0"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.15.0"
  spec.add_runtime_dependency "jekyll-admin", "~> 0.10.2"
  spec.add_runtime_dependency "kramdown-parser-gfm", "~> 1.1.0"

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "hawkins", "~> 2.0.5"
end