class Creator < ActiveRecord::Base
  has_many :communities
  has_many :players, through: :communities
  has_many :games, through: :communities


end
