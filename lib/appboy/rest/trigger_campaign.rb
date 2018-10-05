module Appboy
  module REST
    class TriggerCampaign < Base
      def perform(app_group_id, campaign_id:, external_user_id:, trigger_properties: {})
        # https://www.braze.com/documentation/REST_API/#sending-messages-via-api-triggered-delivery
        http.post(
          '/campaigns/trigger/send',
          app_group_id: app_group_id,
          campaign_id: campaign_id,
          recipients: [
            {
              external_user_id: external_user_id,
              trigger_properties: trigger_properties,
            },
          ]
        )
      end
    end
  end
end
