module Appboy
  module Resource
    class App
      include Virtus.model

      attribute :name, String
      attribute :platform, String
      attribute :version, String
      attribute :sessions, String
      attribute :first_used, DateTime
      attribute :last_used, DateTime
    end
  end
end
