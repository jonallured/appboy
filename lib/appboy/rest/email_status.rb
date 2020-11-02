module Appboy
  module REST
    class EmailStatus < Base
      attr_reader :email, :status

      def initialize(api_key, email:, status:)
        super(api_key)
        @email = email
        @status = status
      end

      def perform
        http.post '/email/status', {
          email: email,
          subscription_state: status
        }
      end
    end
  end
end
