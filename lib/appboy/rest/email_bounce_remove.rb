module Appboy
  module REST
    class EmailBounceRemove < Base
      attr_reader :app_group_id, :email

      def initialize(app_group_id, email:)
        @app_group_id = app_group_id
        @email = email
      end

      def perform
        http.post(
          "/email/bounce/remove",
          app_group_id: app_group_id,
          email: email
        )
      end
    end
  end
end
