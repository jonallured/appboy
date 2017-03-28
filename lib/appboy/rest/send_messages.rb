module Appboy
  module REST
    class SendMessages < Base
      attr_reader :app_group_id, :messages, :external_user_ids, :segment_id, :campaign_id

      def initialize(app_group_id, messages: [], external_user_ids: [], campaign_id: nil, segment_id: nil, logger: nil)
        @app_group_id = app_group_id
        @messages = messages
        @external_user_ids = external_user_ids
        @campaign_id = campaign_id
        @segment_id = segment_id
        @send_uri = '/messages/send'
        @logger = logger
      end

      def perform
        payload = {
            app_group_id:      app_group_id,
            messages:          messages,
            external_user_ids: external_user_ids,
            campaign_id: campaign_id,
            segment_ids:       [segment_id].compact
        }
        @logger.info("#{self.class.name}") { "http.post: #{@send_uri} payload: #{payload.to_s}"} unless @logger.nil?
        http.post @send_uri, payload
      end
    end
  end
end
