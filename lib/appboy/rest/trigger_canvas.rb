module Appboy
  module REST
    class TriggerCanvas < Base
      attr_reader :api_key, :audience, :broadcast, :canvas_id,
                  :canvas_entry_properties, :recipients

      def initialize(app_group_id, options = {})
        @api_key                 = app_group_id
        @audience                = options[:audience]
        @broadcast               = options[:broadcast] || false
        @canvas_entry_properties = options[:canvas_entry_properties]
        @canvas_id               = options[:canvas_id]
        @recipients              = options[:recipients]
      end

      def perform
        http.post '/canvas/trigger/send', {
          api_key:                 api_key,
          audience:                audience,
          broadcast:               broadcast,
          canvas_entry_properties: canvas_entry_properties,
          canvas_id:               canvas_id,
          recipients:              recipients
        }.compact
      end
    end
  end
end
