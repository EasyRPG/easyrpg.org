
source 'https://rubygems.org'

gem 'nanoc', '~> 4.12' # engine
gem 'kramdown'         # markdown converter
gem 'typogruby'        # text enhancements
gem 'rouge'            # syntax highlighting
gem 'slim'             # templates
gem 'builder'          # xml sitemaps
gem 'sass'             # css conversion
gem 'yuicompressor'    # css/js uglifying
gem 'ruby-xxHash'      # for cache busting

group :nanoc do
  gem 'guard-nanoc'    # automatic rebuilds
  gem 'adsf'           # tiny webserver
  gem 'puma'           # webserver backend
end

group :test do
  gem 'nokogiri'       # 
  gem 'w3c_validators' # link checker
end

# nanoc is incompatible with ancient ruby
ruby '> 2.4'
