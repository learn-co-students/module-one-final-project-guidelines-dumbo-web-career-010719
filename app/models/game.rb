class Game < ActiveRecord::Base
  has_many :communities
  has_many :players, through: :communities
  has_many :creators, through: :communities

end
