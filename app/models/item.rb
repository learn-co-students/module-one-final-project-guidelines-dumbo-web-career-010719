class Item < ActiveRecord::Base
  has_many :carts
  has_many :users, through: :carts
  belongs_to :store
end
