module Appboy
  module REST
    class SendMessages < Base
      def perform(messages: [], external_user_ids: [], segment_id: nil)
        http.post '/messages/send', {
          app_group_id:      api.app_group_id,
          messages:          messages,
          external_user_ids: external_user_ids,
          segment_ids:       [segment_id].compact
        }
      end
    end
  end
end
