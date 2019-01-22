class Movie < ActiveRecord::Base
  has_many :users, through: :lists
  has_many :lists
end
