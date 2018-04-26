require 'appboy/deprecated'
require 'appboy/endpoints/track_users'
require 'appboy/endpoints/delete_users'
require 'appboy/endpoints/send_campaign_triggered_messages'
require 'appboy/endpoints/send_messages'
require 'appboy/endpoints/schedule_messages'
require 'appboy/endpoints/email_status'

module Appboy
  class API
    include Appboy::Deprecated

    include Appboy::Endpoints::DeleteUsers
    include Appboy::Endpoints::EmailStatus
    include Appboy::Endpoints::ScheduleMessages
    include Appboy::Endpoints::SendCampaignTriggeredMessages
    include Appboy::Endpoints::SendCanvasTriggeredMessages
    include Appboy::Endpoints::SendMessages
    include Appboy::Endpoints::TrackUsers

    def export_users(**payload)
      Appboy::REST::ExportUsers.new.perform(app_group_id, payload)
    end

    def list_segments
      Appboy::REST::ListSegments.new.perform(app_group_id)
    end

    attr_reader :app_group_id

    def initialize(app_group_id)
      @app_group_id = app_group_id
    end
  end
end
