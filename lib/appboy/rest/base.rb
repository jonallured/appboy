require 'appboy/http'

module Appboy
  module REST
    class Base
      attr_reader :api
      attr_writer :http

      def initialize(api = nil)
        @api = api
      end

      def unwrapped_response
        JSON.parse(response.body).values.first.flatten
      end

      private

      attr_reader :response

      def http
        @http ||= Appboy::HTTP.new
      end
    end
  end
end
