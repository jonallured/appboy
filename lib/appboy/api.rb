require 'appboy/deprecated'
require 'appboy/endpoints/track_users'
require 'appboy/endpoints/send_messages'
require 'appboy/endpoints/schedule_messages'
require 'appboy/endpoints/email_status'

module Appboy
  class API
    include Appboy::Deprecated

    include Appboy::Endpoints::TrackUsers
    include Appboy::Endpoints::SendMessages
    include Appboy::Endpoints::ScheduleMessages
    include Appboy::Endpoints::EmailStatus

    def export_users(**payload)
      Appboy::REST::ExportUsers.new(self).perform(payload)
    end

    attr_reader :app_group_id
    attr_writer :user_resource_class

    def initialize(app_group_id)
      @app_group_id = app_group_id
    end

    def user_resource_class
      @user_resource_class ||= Appboy::Resource::User
    end
  end
end
