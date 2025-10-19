
source 'https://rubygems.org'

gem 'nanoc', '~> 4.13'  # engine
gem 'kramdown'          # markdown converter
gem 'typogruby'         # text enhancements
gem 'rouge'             # syntax highlighting
gem 'slim'              # templates
gem 'erubi'             # templates
gem 'builder'           # xml sitemaps

group :nanoc do
  gem 'nanoc-live'      # automatic rebuilds
  gem 'nanoc-external'  # tidy filter
end

group :development do
  gem 'falcon'          # webserver backend
end

group :test do
  gem 'nokogiri', force_ruby_platform: true # html parser
  gem 'w3c_validators' # link checker
end

# nanoc is incompatible with ancient ruby
ruby '>= 3.2'
