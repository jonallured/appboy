module Appboy
  module Endpoints
    module TriggerCanvas
      def trigger_canvas(**payload)
        trigger_canvas_service.new(app_group_id, payload).perform
      end

      private

      def trigger_canvas_service
        Appboy::REST::TriggerCanvas
      end
    end
  end
end
