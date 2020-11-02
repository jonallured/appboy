module Appboy
  module REST
    class DeleteUsers < Base
      attr_reader :external_ids, :appboy_ids

      def initialize(api_key, external_ids: [], appboy_ids: [])
        super(api_key)
        @external_ids = external_ids
        @appboy_ids   = appboy_ids
      end

      def perform
        http.post '/users/delete', {
          external_ids:   external_ids,
          appboy_ids:     appboy_ids
        }
      end
    end
  end
end
