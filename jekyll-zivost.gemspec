# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "jekyll-zivost"
  spec.version       = "0.1.8"
  spec.authors       = ["Rohit Hazra"]
  spec.email         = ["rohit@zivost.com"]

  spec.summary       = %q{Zivost Official Website.}
  spec.homepage      = "https://zivost.com"
  spec.license       = "Unlicense"

  spec.files         = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r!^(assets|_(includes|layouts|sass)/|(LICENSE|README)((\.(txt|md|markdown)|$)))!i)
  end

  spec.platform      = Gem::Platform::RUBY
  spec.add_runtime_dependency "jekyll", "~> 3.6"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.4"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.1"

  spec.add_development_dependency "bundler", "~> 2.0.2"
  spec.add_development_dependency "rake", "~> 12.3"
end
