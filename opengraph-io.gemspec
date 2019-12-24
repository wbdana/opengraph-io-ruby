Gem::Specification.new do |s|
  s.name      = 'opengraph-io'
  s.version   = '0.1.2'
  s.date      = '2019-12-24'
  s.summary   = 'A Ruby client for opengraph.io, a website scraper to grab OpenGraph tags or supplement them when they don\'t exist. See source at https://www.github.com/wbdana/opengraph-io-ruby'
  s.authors   = ['Will Dana']
  s.email     = 'william.b.dana@gmail.com'
  s.files     = ['lib/opengraph-io.rb']
  s.homepage  = 'https://opengraph.io'
  s.license   = 'MIT'
  s.add_development_dependency 'rspec', '~> 3.7'
end