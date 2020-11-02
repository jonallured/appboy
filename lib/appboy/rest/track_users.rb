module Appboy
  module REST
    class TrackUsers < Base
      def perform(attributes: [], events: [], purchases: [])
        http.post '/users/track', {
          attributes:     attributes,
          events:         events,
          purchases:      purchases
        }
      end
    end
  end
end
