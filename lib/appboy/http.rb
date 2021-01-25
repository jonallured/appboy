require 'faraday'
require 'faraday_middleware'

module Appboy
  class HTTP
    attr_reader :api_key

    def initialize(api_key)
      @api_key = api_key
    end

    def post(path, payload)
      connection.post path do |request|
        request.body = payload
      end
    end

    def get(path, query = {})
      connection.get path, query
    end

    def connection
      @connection ||= Faraday.new(url: api_host,
                                  headers: { Authorization: "Bearer #{api_key}" }) do |connection|
        connection.request :json

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
