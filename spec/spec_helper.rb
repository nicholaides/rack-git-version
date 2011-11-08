require "rubygems"
require "rspec"
require "rack/test"

$LOAD_PATH.unshift File.dirname(File.dirname(__FILE__)) + '/lib'
$LOAD_PATH.unshift File.dirname(File.dirname(__FILE__))

require "rack-git-version"

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
