module Appboy
  module REST
    class ScheduleMessages < Base
      attr_reader :app_group_id, :send_at, :messages, :segment_id, :local_timezone, :external_user_ids

      def initialize(app_group_id, send_at:, messages: [], segment_id: nil, external_user_ids: [], local_timezone: false)
        @app_group_id = app_group_id
        @send_at = send_at
        @messages = messages
        @segment_id = segment_id
        @external_user_ids = external_user_ids
        @local_timezone = local_timezone
      end

      def perform
        http.post('/messages/schedule/create', {
          app_group_id: app_group_id,
          external_user_ids: external_user_ids,
          segment_id: segment_id,
          messages: messages,
          schedule: {
            time: send_at,
            in_local_time: local_timezone
          }
        })
      end
    end
  end
end
