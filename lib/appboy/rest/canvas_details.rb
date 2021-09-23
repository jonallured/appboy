module Appboy
  module REST
    class CanvasDetails < Base
      def perform(app_group_id, canvas_id:)
        http.get(
          '/canvas/details',
          app_group_id: app_group_id,
          canvas_id: canvas_id,
        )
      end
    end
  end
end
