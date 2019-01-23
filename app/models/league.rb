class League < ActiveRecord::Base
  belongs_to :creator
  belongs_to :game
  belongs_to :player

  def all_players
    
  end
end
