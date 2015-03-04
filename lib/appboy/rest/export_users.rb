module Appboy
  module REST
    class ExportUsers < Base
      def perform(external_ids:)
        perform_request external_ids

        unwrapped_response.map do |attributes|
          resource_class.new.from_hash attributes
        end
      end

      private

      def resource_class
        api.user_resource_class
      end

      def perform_request(external_ids)
        @response ||= http.post '/users/export/ids', {
          app_group_id: api.app_group_id,
          external_ids: external_ids
        }
      end
    end
  end
end
