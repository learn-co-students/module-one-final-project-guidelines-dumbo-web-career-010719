require_relative '../config/environment'
require 'tty-prompt'


def welcome
  prompt = TTY::Prompt.new
  response = prompt.select("Welcome to the Flatiron Dating Sim!", %w(new_game load_game))
  if response == 'new_game'
    new_game
<<<<<<< HEAD
  elsif response == 'load_game'
    load_game
=======
>>>>>>> 41b3971cd8e6f7c4d6b0638f20db525905d981ad
  end
end



welcome
