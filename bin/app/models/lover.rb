class Lover < ActiveRecord::Base
  has_many :dates
  has_many :users, through: :dates


end
