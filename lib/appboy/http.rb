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
      @connection ||= Faraday.new(url: 'https://api.appboy.com') do |connection|
        connection.request :json
        connection.response :json,  content_type: 'application/json'
        connection.adapter Faraday.default_adapter
      end
    end
  end
end
