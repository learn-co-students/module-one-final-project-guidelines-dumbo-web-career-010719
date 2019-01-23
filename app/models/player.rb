class Player < ActiveRecord::Base
  has_many :leagues
  has_many :creators, through: :leagues
  has_many :games, through: :leagues

  # def self.sign_up({username, location, age})
  #   Player.create(username, location, age)
  # end


end
