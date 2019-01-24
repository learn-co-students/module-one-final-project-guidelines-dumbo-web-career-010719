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
type = prompt.select("Please choose to create or to join a league.", %w(Create View_Communities))
# Community.main_menu
  if type == "Create"

        username = prompt.collect do
          key(:username).ask('username?')
        end

        user = Creator.create(username)
        community = prompt.collect do
          key(:location).select('location of community?', %w(Manhattan Brooklyn Queens Bronx Buffalo Albany))
          key(:start_date).ask('start date of community? (example: yyyymmdd)')
          key(:title).select('which game is the community for?', %w(Super_Smash_Brothers_Ultimate Fortnite League_of_Legends Call_of_Duty Overwatch Battlefield_5))
        end
          # League.last.creator_id = Creator.last.id
          Community.last.update(creator_id: Creator.last.id)
            # binding.pry
          # answer2 = prompt.select('What would you like to do?', %w(To_see_all_of_my_leagues))
        puts "Thank you for creating the community!"

  elsif type == "View_Communities"
        community_locations = prompt.select('location?', %w(Manhattan Brooklyn Queens Bronx Buffalo Albany))
        #if there is no community within the location, we should ask to create or go back
        n = 0
        Community.all.map do |ooo|
          if "#{ooo.location}" == community_locations
            puts "#{ooo.location} - #{ooo.title}"
            n += 1
          end
        end


        q1 = prompt.yes?("Would you like to join one?")

            if q1 == true
              if  n = 1
                prompt.select("Sorry there are no communities. You want to start a new community?", %w(Yes No))
              end

              q2 = prompt.ask("Which community would you like to join? (ex. Game Title)")
              q1_answer = prompt.collect do
                key(:username).ask('username?')
                key(:age).ask('age?(example: 21)', convert: :int)
              end
              q1_answer[:location] = community_locations

              Player.create(q1_answer)
              # q2 = prompt.ask("Which community would you like to join? (ex. Location - Game Title)")
              why = Community.find_by(location: community_locations ,title: q2)
              why.player_id = Player.last.id
              binding.pry
              #   if q2 == leagues.
              # # binding.pry

              # q2 = prompt.select("What would you like to do?", %w(Create_a_new_community_for_your_location. Go_back_to_main_menu.) )
            else
              puts "You are now directed back to the main menu."
              prompt.select("Please choose to create or to join a league.", %w(Create View_Communities))
            end


  end


    # Able to choose whether you want to join an existing league or to create a new one

    # If you want to join... be able to choose where you would like to choose
    # If you choose to create, you go back to the first.
