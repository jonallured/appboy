module Appboy
  module REST
    class TriggerCanvas < Base
      attr_reader :audience, :broadcast, :canvas_id, :canvas_entry_properties, :recipients

      def initialize(api_key, options = {})
        super(api_key)
        @audience                = options[:audience]
        @broadcast               = options[:broadcast] || false
        @canvas_entry_properties = options[:canvas_entry_properties]
        @canvas_id               = options[:canvas_id]
        @recipients              = options[:recipients]
      end

      def perform
        http.post '/canvas/trigger/send', {
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
