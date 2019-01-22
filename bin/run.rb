require_relative '../config/environment'
require 'tty-prompt'

def welcome
  prompt = TTY::Prompt.new
  response = prompt.select("Welcome to the Flatiron Dating Sim!", %w(New_Game Load_Game))
end

def New_Game

end

def Load_Game
  
end
welcome
