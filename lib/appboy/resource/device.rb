module Appboy
  module Resource
    class Device
      include Virtus.model

      attribute :model, String
      attribute :os, String
      attribute :carrier, String
      attribute :idfv, String
    end
  end
end
