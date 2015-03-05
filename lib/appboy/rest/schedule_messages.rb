module Appboy
  module REST
    class ScheduleMessages < Base
      attr_reader :send_at, :messages, :segment_id, :local_timezone

      def perform(send_at:, messages: [], segment_id: nil, local_timezone: false)
        http.post '/messages/schedule', {
          app_group_id:              api.app_group_id,
          segment_ids:               [segment_id],
          send_at:                   send_at,
          deliver_in_local_timezone: local_timezone,
          messages:                  messages
        }
      end
    end
  end
end
