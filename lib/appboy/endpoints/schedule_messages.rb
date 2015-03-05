module Appboy
  module Endpoints
    module ScheduleMessages
      def schedule_messages(**payload)
        schedule_messages_service.new(self).perform payload
      end

      private

      def schedule_messages_service
        Appboy::REST::ScheduleMessages
      end
    end
  end
end
