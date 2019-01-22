require_relative '../config/environment'
require 'tty-prompt'


def welcome
  prompt = TTY::Prompt.new
  response = prompt.select("Welcome to the Flatiron Dating Sim!", %w(new_game load_game))
  if response == 'new_game'
    new_game
  end
end



welcome
