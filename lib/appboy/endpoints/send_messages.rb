module Appboy
  module Endpoints
    module SendMessages
      def send_messages(**payload)
        send_messages_service.new(self).perform payload
      end

      private

      def send_messages_service
        Appboy::REST::SendMessages
      end
    end
  end
end
