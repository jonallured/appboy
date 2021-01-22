module Appboy
  module REST
    class ListCanvas < Base
      attr_reader :app_group_id, :sort_direction, :include_archived

      def initialize(app_group_id, options = {})
        @app_group_id = app_group_id
        @sort_direction = options[:sort_direction]
        @include_archived = options[:include_archived]
      end

      def perform
        http.get '/canvas/list', {
          app_group_id: app_group_id,
          sort_direction: sort_direction,
          include_archived: include_archived
        }.compact
      end
    end
  end
end
