module Appboy
  module REST
    class TriggerCampaign < Base
      attr_reader :api_key, :audience, :broadcast, :campaign_id,
                  :recipients, :send_id, :trigger_properties

      def initialize(api_key, options = {})
        @api_key            = api_key
        @audience           = options[:audience]
        @broadcast          = options[:broadcast] || false
        @campaign_id        = options[:campaign_id]
        @recipients         = options[:recipients]
        @send_id            = options[:send_id]
        @trigger_properties = options[:trigger_properties]
      end

      def perform
        http.post '/campaigns/trigger/send', {
          api_key:            api_key,
          audience:           audience,
          broadcast:          broadcast,
          campaign_id:        campaign_id,
          recipients:         recipients,
          send_id:            send_id,
          trigger_properties: trigger_properties
        }.compact
      end
    end
  end
end
