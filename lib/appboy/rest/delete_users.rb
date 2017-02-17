module Appboy
  module REST
    class DeleteUsers < Base
      attr_reader :app_group_id, :external_ids, :appboy_ids

      def initialize(app_group_id, external_ids: [], appboy_ids: [])
        @app_group_id = app_group_id
        @external_ids = external_ids
        @appboy_ids = appboy_ids
      end

      def perform
        http.post '/users/delete', {
          app_group_id:      app_group_id,
          external_ids:      external_ids,
          appboy_ids:        appboy_ids
        }
      end
    end
  end
end
