require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/explain-query'

Hoe.plugin :newgem

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'explain-query' do
  self.developer 'Gustav Paul', 'gustav@rails.co.za'
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }
