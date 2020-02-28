module Appboy
  module REST
    class ExportUsers < Base
      def perform(app_group_id, braze_id: nil, device_id: nil, email_address: nil, external_ids: nil, segment_id: nil, user_aliases: nil, **options)
        if braze_id.present?
          export_users_by_ids(app_group_id, braze_id: braze_id)
        elsif device_id.present?
          export_users_by_ids(app_group_id, device_id: device_id)
        elsif email_address.present?
          export_users_by_ids(app_group_id, email_address: email_address)
        elsif external_ids.present?
          export_users_by_ids(app_group_id, external_ids: external_ids)
        elsif segment_id.present?
          export_users_by_segment(app_group_id, segment_id, options)
        elsif user_aliases.present?
          export_users_by_ids(app_group_id, user_aliases: user_aliases)
        else
          raise Error('Please provide at least one valid identifier')
        end
      end

      private

      def export_users_by_ids(app_group_id, identifier)
        http.post '/users/export/ids', {
          app_group_id: app_group_id
        }.merge(identifier)
      end

      def export_users_by_segment(app_group_id, segment_id, options)
        http.post '/users/export/segment', {
          app_group_id: app_group_id,
          segment_id: segment_id
        }.merge(options)
      end
    end
  end
end
