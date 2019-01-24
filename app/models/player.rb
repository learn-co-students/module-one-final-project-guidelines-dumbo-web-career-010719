class Player < ActiveRecord::Base
  has_many :communities
  has_many :creators, through: :communities
  has_many :games, through: :communities

  # def self.sign_up({username, location, age})
  #   Player.create(username, location, age)
  # end


end
