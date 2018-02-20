require 'spec_helper'
require 'appboy/http'

describe Appboy::HTTP do
  describe '#connection' do
    it 'sets the default url prefix' do
      expect(subject.connection.url_prefix.to_s).to eql "https://api.appboy.com/"
    end

    context 'when the env contains `APPBOY_REST_BASE_URL` env variable' do
      before { ENV['APPBOY_REST_BASE_URL'] = "https://new.braze.com" }
      after  { ENV.delete('APPBOY_REST_BASE_URL') }

      it 'initializes the connection with it' do
        expect(subject.connection.url_prefix.to_s).to eql "https://new.braze.com/"
      end
    end
  end
end
