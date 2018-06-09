module Appboy
  module REST
    class EmailUnsubscribes < Base
      attr_reader :app_group_id, :email

      def initialize(app_group_id, email:)
        @app_group_id = app_group_id
        @email = email
      end

      def perform
        http.get '/email/unsubscribes', {
          app_group_id: app_group_id,
          email: email
        }
      end
    end
  end
end
