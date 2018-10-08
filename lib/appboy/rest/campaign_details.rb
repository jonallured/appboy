module Appboy
  module REST
    class CampaignDetails < Base
      def perform(app_group_id, campaign_id:)
        http.get(
          '/campaigns/details',
          app_group_id: app_group_id,
          campaign_id: campaign_id,
        )
      end
    end
  end
end
