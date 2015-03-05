module Appboy
  module Resource
    class Purchase
      include Virtus.model

      attribute :name, String
      attribute :first, DateTime
      attribute :last, DateTime
      attribute :count, Integer
    end
  end
end
