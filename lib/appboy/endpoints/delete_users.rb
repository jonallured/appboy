module Appboy
  module Endpoints
    module DeleteUsers
      def delete_users(**payload)
        delete_users_service.perform(app_group_id, payload)
      end

      private

      def delete_users_service
        @delete_users_service ||= Appboy::REST::DeleteUsers.new
      end
    end
  end
end
