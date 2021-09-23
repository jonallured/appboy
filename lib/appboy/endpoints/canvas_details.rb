module Appboy
  module Endpoints
    module CanvasDetails
      def canvas_details(**payload)
        canvas_details_service.perform(app_group_id, payload)
      end

      private

      def canvas_details_service
        @canvas_details_service ||= Appboy::REST::CanvasDetails.new
      end
    end
  end
end
