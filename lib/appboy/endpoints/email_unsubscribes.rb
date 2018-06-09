module Appboy
  module Endpoints
    module EmailUnsubscribes
      def email_unsubscribes(**payload)
        email_unsubscribes_service.new(app_group_id, payload).perform
      end

      def email_unsubscribes_service
        Appboy::REST::EmailUnsubscribes
      end
    end
  end
end
