require 'appboy/deprecated'
require 'appboy/endpoints/delete_users'
require 'appboy/endpoints/email_status'
require 'appboy/endpoints/schedule_messages'
require 'appboy/endpoints/send_messages'
require 'appboy/endpoints/track_users'
require 'appboy/endpoints/trigger_campaign'
require 'appboy/endpoints/trigger_canvas'

module Appboy
  class API
    include Appboy::Deprecated

    include Appboy::Endpoints::DeleteUsers
    include Appboy::Endpoints::EmailStatus
    include Appboy::Endpoints::ScheduleMessages
    include Appboy::Endpoints::SendMessages
    include Appboy::Endpoints::TrackUsers
    include Appboy::Endpoints::TriggerCampaign
    include Appboy::Endpoints::TriggerCanvas

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
