module Appboy
  module REST
    class EmailUnsubscribes < Base
      attr_reader :app_group_id, :email, :start_date, :end_date, :limit, :offset

      def initialize(app_group_id, email: nil, start_date: nil, end_date: nil, limit: nil, offset: nil)
        @app_group_id = app_group_id
        @email = email
        @start_date = start_date
        @end_date = end_date
        @limit = limit
        @offset = offset
      end

      def perform
        http.get '/email/unsubscribes', payload
      end

      private

      def payload
        {
          app_group_id: app_group_id,
          email: email,
          start_date: start_date,
          end_date: end_date,
          limit: limit,
          offset: offset,
        }.select { |_, value| !value.nil? }
      end
    end
  end
end
