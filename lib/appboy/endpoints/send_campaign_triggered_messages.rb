module Appboy
  module Endpoints
    module SendCampaignTriggeredMessages
      def send_campaign_triggered_messages(**payload)
        send_campaign_triggered_messages_service.new(app_group_id, payload).perform
      end

      private

      def send_campaign_triggered_messages_service
        Appboy::REST::SendCampaignTriggeredMessages
      end
    end
  end
end
