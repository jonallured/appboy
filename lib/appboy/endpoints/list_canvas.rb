module Appboy
  module Endpoints
    module ListCanvas
      def list_canvas(**payload)
        list_canvas_service.new(app_group_id, payload).perform
      end

      private

      def list_canvas_service
        Appboy::REST::ListCanvas
      end
    end
  end
end
