module Appboy
  module Resource
    class Campaign
      include Virtus.model

      attribute :name, String
      attribute :last_received, DateTime
    end
  end
end
