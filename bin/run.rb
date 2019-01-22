require_relative '../config/environment'
require 'tty-prompt'



nikki = Lover.create(name: "Nikki", gender: "Female", personality: "Fierce", interest: "fitness", fitness_req: 30, intellect_req: 15, kindness_req: 15, money_req: 100)
kira = Lover.create(name: "Kira", gender: "Female", personality: "Sweet", interest: "volunteering", fitness_req: 10, intellect_req: 20, kindness_req: 30, money_req: 50)
princess = Lover.create(name: "Princess", gender: "Female", personality: "Shallow", interest: "money", fitness_req: 30, intellect_req: 30, kindness_req: 10, money_req: 1000)
penelope = Lover.create(name: "Penelope", gender: "Female", personality: "Nerdy", interest: "intellect", fitness_req: 10, intellect_req: 40, kindness_req: 10, money_req: 20)



def welcome
  prompt = TTY::Prompt.new
  response = prompt.select("Welcome to the Flatiron Dating Sim!", %w(new_game load_game))
  if response == 'new_game'
    new_game
  elsif response == 'load_game'
    load_game
  end
end



welcome
