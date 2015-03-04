module Appboy
  module REST
    class ExportUsers < Base
      def perform(external_ids:)
        user.from_json response(external_ids).body
      end

      private

      def user
        api.user_resource
      end

      def response(external_ids)
        http.post '/users/export/ids', {
          app_group_id: api.app_group_id,
          external_ids: external_ids
        }
      end
    end
  end
end
