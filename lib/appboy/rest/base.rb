require 'appboy/http'

module Appboy
  module REST
    class Base
      attr_writer :http
      attr_reader :api_key

      def initialize(api_key)
        @api_key = api_key
      end

      private

      def http
        @http ||= Appboy::HTTP.new(api_key)
      end
    end
  end
end
