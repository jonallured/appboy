module Appboy
  module REST
    class DeleteUsers < Base
      def perform(app_group_id, external_ids: [], appboy_ids: [])
        http.post '/users/delete', {
          app_group_id:   app_group_id,
          external_ids:   external_ids,
          appboy_ids:     appboy_ids,
        }
      end
    end
  end
end
