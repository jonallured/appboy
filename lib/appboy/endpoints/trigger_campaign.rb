module Appboy
  module Endpoints
    module TriggerCampaign
      def trigger_campaign(**payload)
        trigger_campaign_service.new(api_key, payload).perform
      end

      private

      def trigger_campaign_service
        Appboy::REST::TriggerCampaign
      end
    end
  end
end
