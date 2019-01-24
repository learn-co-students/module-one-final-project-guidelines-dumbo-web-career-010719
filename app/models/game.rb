class Game < ActiveRecord::Base
  has_many :leagues
  has_many :players, through: :leagues
  has_many :creators, through: :leagues

end
