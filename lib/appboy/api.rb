require 'appboy/deprecated'
require 'appboy/endpoints/track_users'
require 'appboy/endpoints/delete_users'
require 'appboy/endpoints/send_messages'
require 'appboy/endpoints/schedule_messages'
require 'appboy/endpoints/email_status'
require 'appboy/endpoints/trigger_campaign'
require 'appboy/endpoints/trigger_canvas'
require 'appboy/endpoints/list_canvas'

module Appboy
  class API
    include Appboy::Deprecated

    include Appboy::Endpoints::TrackUsers
    include Appboy::Endpoints::DeleteUsers
    include Appboy::Endpoints::SendMessages
    include Appboy::Endpoints::ScheduleMessages
    include Appboy::Endpoints::EmailStatus
    include Appboy::Endpoints::TriggerCampaign
    include Appboy::Endpoints::TriggerCanvas
    include Appboy::Endpoints::ListCanvas

    def export_users(**payload)
      Appboy::REST::ExportUsers.new(api_key).perform(payload)
    end

    def list_segments
      Appboy::REST::ListSegments.new(api_key).perform
    end

    attr_reader :api_key

    def initialize(api_key)
      @api_key = api_key
    end
  end
end

