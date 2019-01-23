require_relative '../config/environment'
require 'pry'

# puts "Welcome to League Central"
#
# puts "Would you like to create or join a league?"
# answer1 = gets.chomp
#
#   if answer1.downcase == "join"
#     puts "First, please provide us with your 'username'."
#       username_answer = gets.chomp
#     puts "Thank you. Please provide us with your 'location'."
#       location_answer = gets.chomp
#     puts
#
#   elsif answer1.downcase = "create"
#     puts ""
#   else
#     puts "Invaild Answer. Please enter 'join' or 'create'."
#   end

puts "------------------------------"
puts " "
puts "  Welcome to League Central!"
puts " "
puts "------------------------------"

prompt = TTY::Prompt.new
type = prompt.select("Please choose to create or to join a league.", %w(Join Create))

  if type == "Create"

    username = prompt.collect do
      key(:username).ask('username?')
    end
    # binding.pry
    user = Creator.create(username)
    league = prompt.collect do
      key(:name).ask('name of league?')
      key(:location).select('location of league?', %w(Manhattan Brooklyn Queens Bronx Buffalo Albany))
      key(:start_date).ask('start date of league? (example: yyyymmdd)')
      key(:title).select('which game is the league for?', %w(Super_Smash_Brothers_Ultimate Fortnite League_of_Legends Call_of_Duty Overwatch Battlefield_5))
      end
      League.create(league)

      # League.last.creator_id = Creator.last.id
      League.last.update(creator_id: Creator.last.id)
        binding.pry





  elsif type == "Join"
    players_result = prompt.collect do
      key(:username).ask('username?')
      key(:location).select('location?', %w(Manhattan Brooklyn Queens Bronx Buffalo Albany))
      key(:age).ask('age?(example: 21)', convert: :int)
    end
  end
