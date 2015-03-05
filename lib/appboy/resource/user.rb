module Appboy
  module Resource
    class User
      include Virtus.model

      attribute :external_id, String
      attribute :first_name, String
      attribute :last_name, String
      attribute :email, String
      attribute :dob, DateTime
      attribute :country, String
      attribute :language, String
      attribute :gender, String
      attribute :timezone, String
      attribute :push_subscribe, String
      attribute :email_subscribe, String
      attribute :total_revenue, Float

      attribute :devices, [Device]
      attribute :apps, [App]
      attribute :custom_events, [Event]
      attribute :purchases, [Purchase]
      attribute :cards_clicked, [Card]
      attribute :campaigns_received, [Campaign]
      attribute :custom_attributes, Hash
    end
  end
end
