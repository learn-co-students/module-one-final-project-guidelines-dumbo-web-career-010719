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
prompt.select("Please choose to create or to join a league.", %w(Join Create))

  if prompt == "Create"
    prompt.ask("Please provide us with your username.", default: ENV['USERNAME'])
    # binding.pry
  else
    players_result = prompt.collect do
      key(:username).ask('username?')
      key(:location).select('location?', %w(Manhattan Brooklyn Queens Bronx Buffalo Albany))
      key(:age).ask('age?(example: 21)', convert: :int)
    end
  end
