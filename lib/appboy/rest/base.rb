require 'appboy/http'

module Appboy
  module REST
    class Base
      attr_reader :api
      attr_writer :http

      def initialize(api = nil)
        @api = api
      end

      private

      def http
        @http ||= Appboy::HTTP.new
      end
    end
  end
end
