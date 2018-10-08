module Appboy
  module Endpoints
    module CampaignDetails
      def campaign_details(**payload)
        campaign_details_service.perform(app_group_id, payload)
      end

      private

      def campaign_details_service
        @campaign_details_service ||= Appboy::REST::CampaignDetails.new
      end
    end
  end
end
