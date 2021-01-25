module Appboy
  module REST
    class ScheduleMessages < Base
      attr_reader :time, :messages, :external_user_ids, :local_timezone

      def initialize(api_key, time:, messages: [], external_user_ids: [], local_timezone: false)
        super(api_key)
        @time = time
        @messages = messages
        @external_user_ids = external_user_ids
        @local_timezone = local_timezone
      end

      def perform
        http.post '/messages/schedule/create', {
          external_user_ids:                external_user_ids,
          schedule: {
            time:                   time,
            in_local_time:          local_timezone
          },
          messages:                  messages
        }
      end
    end
  end
end
