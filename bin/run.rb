require_relative '../config/environment'
require 'tty-prompt'


def welcome
  main_menu = [
    {   "new game" => -> do new_game end },
      {  "load game" => -> do load_game end},
      {"delete file" => -> do delete_file end}
  ]
  prompt = TTY::Prompt.new
  response = prompt.select("Welcome to the Flatiron Dating Sim!", main_menu)
  end

  # if response == 'new_game'
  #   new_game
  # elsif response == 'load_game'
  #   load_game
  # elsif response == 'delete_file'
  #   delete_file
  # end



welcome
