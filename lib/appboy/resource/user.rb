require 'roar/json'
require 'roar/coercion'

module Appboy
  module Resource
    class User < OpenStruct
      include Roar::JSON
      include Roar::Coercion

      property :first_name, type: String
      property :last_name, type: String
      property :email, type: String
    end
  end
end
