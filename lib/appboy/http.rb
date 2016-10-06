require 'faraday'
require 'faraday_middleware'

module Appboy
  class HTTP
    def post(path, payload)
      req = connection.post path, payload
      {body: req.body, headers: req.headers, status: req.status }
    end

    def get(path, query)
      req = connection.get path, query
      {body: req.body, headers: req.headers,  status: req.status }
    end

    def connection
      @connection ||= Faraday.new(url: 'https://api.appboy.com') do |connection|
        connection.request :json

        connection.adapter Faraday.default_adapter
      end
    end
  end
end
