module Appboy
  module REST
    class TriggerCampaign < Base
      attr_accessor :app_group_id, :campaign_id, :external_user_ids, :trigger_properties

      def initialize(app_group_id, campaign_id:, external_user_ids: [], trigger_properties: {})
        @app_group_id = app_group_id
        @campaign_id = campaign_id
        @external_user_ids = external_user_ids
        @trigger_properties = trigger_properties
      end

      def perform
        # https://www.braze.com/documentation/REST_API/#sending-messages-via-api-triggered-delivery
        http.post(
          '/campaigns/trigger/send',
          app_group_id: app_group_id,
          campaign_id: campaign_id,
          recipients: {
            external_user_ids: external_user_ids,
          },
          trigger_properties: trigger_properties,
        )
      end
    end
  end
end
