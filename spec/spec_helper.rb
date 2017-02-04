require 'pry'
require 'dotenv'
require 'bundler/setup'

Bundler.setup
Dotenv.load

require 'appboy'
require 'factory'
require 'support/vcr'
require 'support/integrations'

RSpec.configure do |config|
  def test_time
    Time.parse('2015-02-15 00:00:00 -0500')
  end
  include Factory
end
