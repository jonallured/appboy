module Appboy
  module Endpoints
    module TriggeredDeliveries
      def triggered_deliveries(**payload)
        triggered_deliveries_service.new(app_group_id, payload).perform
      end

      private

      def triggered_deliveries_service
        Appboy::REST::TriggeredDeliveries
      end
    end
  end
end
