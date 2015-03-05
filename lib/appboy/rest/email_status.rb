module Appboy
  module REST
    class EmailStatus < Base
      def perform(email:, status:)
        http.post '/email/status', {
          app_group_id: api.app_group_id,
          email: email,
          subscription_state: status
        }
      end
    end
  end
end
