module Appboy
  module Endpoints
    module TriggerCampaign
      def trigger_campaign(**payload)
        trigger_campaign_service.perform(app_group_id, payload)
      end

      private

      def trigger_campaign_service
        @trigger_campaign_service ||= Appboy::REST::TriggerCampaign.new
      end
    end
  end
end
