require 'active_support/concern'

module Rest
  extend ActiveSupport::Concern

  included do
    let(:http) { double(:http) }
    let(:api) { Appboy::API.new :app_group_id }

    subject(:client) { described_class.new(api) }
    before { client.http = http }
  end

  RSpec.configure do |config|
    config.include self, type: :rest, file_path: %r(spec/appboy/rest)
  end
end
