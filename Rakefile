# Rakefile for common nanoc tasks

# use bundled gems
require "bundler/setup"

# provide cleanup targets
require 'rake/clean'
CLEAN.include("output/**", "output/.ht*")
CLOBBER.include("tmp/**")

desc "Compile website and view locally"
task :default => [ :compile, :view ]

desc "Clear, compile and check website"
task :all => [ :clean, :compile, :check ]

desc "Compile website"
task :compile do
  sh('nanoc compile')
end

desc "Automatically rebuild website on changes"
task :rebuild do
  puts "Use exit to end the guard shell."
  sh('guard')
end

desc "Make website available at http://localhost:3000"
task :view do
  sh('nanoc view')
end

desc "Check compiled website for problems"
task :check do
  sh('nanoc check internal_links external_links stale css html')
end
