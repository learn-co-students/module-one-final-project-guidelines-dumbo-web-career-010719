class User < ActiveRecord::Base
  has_many :movies, through: :lists
  has_many :lists
end
