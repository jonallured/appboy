require 'faraday'
require 'faraday_middleware'

module Appboy
  class HTTP
    def post(path, payload)
      connection.post(path) do |request|
        request.body = payload
      end.body
    end

    def get(path, query)
      connection.get(path, query).body
    end

    def connection
      @connection ||= Faraday.new(url: api_host) do |connection|
        connection.request :json

        connection.response :json
        connection.response :logger if ENV['APPBOY_DEBUG']

        connection.adapter Faraday.default_adapter
      end
    end

    private

    def api_host
      @api_host ||= ENV.fetch('APPBOY_REST_BASE_URL', 'https://api.appboy.com')
    end
  end
end
