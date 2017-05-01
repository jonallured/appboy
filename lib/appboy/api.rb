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

  end
end
