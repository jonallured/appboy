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
        payload = {
          app_group_id:      app_group_id,
          schedule: {time: send_at, in_local_time: local_timezone},
          messages:                  messages
        }
        if external_user_ids.size > 0
          payload.merge!(external_user_ids: external_user_ids)
        else
          payload.merge!(segment_id: segment_id)
        end
        http.post '/messages/schedule/create', payload
      end
    end
  end
end
