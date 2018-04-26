module Appboy
  module Endpoints
    module SendCanvasTriggeredMessages
      def send_canvas_triggered_messages(**payload)
        send_canvas_triggered_messages_service.new(app_group_id, payload).perform
      end

      private

      def send_canvas_triggered_messages_service
        Appboy::REST::SendCanvasTriggeredMessages
      end
    end
  end
end
