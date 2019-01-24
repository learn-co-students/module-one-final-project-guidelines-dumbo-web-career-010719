class Creator < ActiveRecord::Base
  has_many :leagues
  has_many :players, through: :leagues
  has_many :games, through: :leagues


end
