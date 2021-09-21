module Appboy
  module Endpoints
    module Email
      def email_status(**payload)
        email_status_service.new(app_group_id, payload).perform
      end

      def email_unsubscribes(**payload)
        email_unsubscribes_service.new(app_group_id, payload).perform
      end

      def email_bounce_remove(**payload)
        email_bounce_remove_service.new(app_group_id, payload).perform
      end

      private

      def email_unsubscribes_service
        Appboy::REST::EmailUnsubscribes
      end

      def email_status_service
        Appboy::REST::EmailStatus
      end

      def email_bounce_remove_service
        Appboy::REST::EmailBounceRemove
      end
    end
  end
end
