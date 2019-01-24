class Community < ActiveRecord::Base
  belongs_to :creator
  belongs_to :game
  belongs_to :player

  def main_menu
    type = prompt.select("Please choose to create or to join a league.", %w(Create View_Communities))
  end
  # def all_players
  #
  # end


end
