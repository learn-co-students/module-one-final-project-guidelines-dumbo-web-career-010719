class User < ActiveRecord::Base
  has_many :carts
  has_many :items, through: :carts
end
