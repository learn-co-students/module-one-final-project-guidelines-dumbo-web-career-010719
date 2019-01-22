class User < ActiveRecord::Base
  has_many :dates
  has_many :lovers, through: :dates
end
