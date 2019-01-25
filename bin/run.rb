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
def run_program

puts "---------------------------------"
puts " "
puts "  Welcome to Community Central!"
puts " "
puts "---------------------------------"
prompt = TTY::Prompt.new
type = prompt.select("Please choose to create or to view a community.", %w(Create View_Communities Update_An_Existing_Community Exit))
# Community.main_menu
  if type == "Create"

        username = prompt.collect do
          key(:username).ask('username?')
        end

        Creator.create(username)
        community = prompt.collect do
          key(:location).select('location of community?', %w(Manhattan Brooklyn Queens Bronx Buffalo Albany))
          # key(:start_date).ask('start date of community? (example: mm/dd)')
          key(:title).select('which game is the community for?', %w(Super_Smash_Brothers_Ultimate Fortnite League_of_Legends Call_of_Duty Overwatch Battlefield_5))
        end
          # League.last.creator_id = Creator.last.id
          Community.create(community)
          Community.last.update(creator_id: Creator.last.id, game_id: Game.find_by(title: Community.last.title).id)
            # binding.pry
          # answer2 = prompt.select('What would you like to do?', %w(To_see_all_of_my_leagues))
        puts "-----------------------------------------"
        puts " "
        puts "   Thank you for creating a community!"
        puts " "
        puts "-----------------------------------------"

      q1 = prompt.select("Would you like to go back to the main menu or exit the program?", %w(Main_menu Exit))
          if q1 == "Main_menu"
            run_program
          elsif q1 == "Exit"
            exit
          end




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

        if n < 1
          q1 = prompt.select("Sorry there are no communities in this location. Do you want to create a new community?", %w(Yes No))

          if q1 == "Yes"
            username = prompt.collect do
              key(:username).ask('username?')
            end

            Creator.create(username)
            title = prompt.collect do
              # key(:start_date).ask('start date of community? (example: mm/dd)')
              key(:title).select('which game is the community for?', %w(Super_Smash_Brothers_Ultimate Fortnite League_of_Legends Call_of_Duty Overwatch Battlefield_5))
            end
            title[:location] = community_locations
            title[:creator_id] = Creator.last.id
            # title[:game_id] =
              # League.last.creator_id = Creator.last.id
            Community.create(title)
            Community.last.update(creator_id: Creator.last.id, game_id: Game.find_by(title: Community.last.title).id)

            puts "-----------------------------------------"
            puts " "
            puts "   Thank you for creating a community!"
            puts " "
            puts "-----------------------------------------"

          elsif q1 == "No"
            run_program
        end

        elsif n >= 1
          q2 = prompt.select("Would you like to join one?", %w(Yes No))
            if q2 == "Yes"
              q3 = prompt.ask("Which community would you like to join? (example: Game_Title)")
              q3_answer = prompt.collect do
                key(:username).ask('username?')
                key(:age).ask('age?(example: 21)', convert: :int)
              end

              q3_answer[:location] = community_locations
              Player.create(q3_answer)
              Community.find_by(location: community_locations ,title: q3).update(player_id: Player.last.id)
              # Community.find_by(location: community_locations ,title: q3).update(player_id: Player.last.id)
              puts "-----------------------------------------"
              puts " "
              puts "   Thank you for joining a community!"
              puts " "
              puts "-----------------------------------------"
            elsif q2 == "No"
              run_program
            end
        end




  elsif type == "Update_An_Existing_Community"
    Community.all.map do |ooo|
      puts "#{ooo.location} - #{ooo.title}"
    end

    q5 = prompt.ask("Which community would you like to update?")
    q5 = q5.split(" - ")
    q6 = prompt.ask("What is your username?")
    id_check = Community.find_by(location: q5[0] ,title: q5[1]).creator_id

    if Creator.find_by(username: q6) == id_check
      q7 = prompt.select("What would you like to update/delete?", %w(Change_location Delete_Community))

      if q7 == "Change_location"
        q8 = prompt.select('Where do you want to move to?', %w(Manhattan Brooklyn Queens Bronx Buffalo Albany))
        Community.find_by(location: q5[0] ,title: q5[1]).update(location: q8)
      elsif q7 == "Delete_Community"
        q8 = prompt.select("Do you really want to delete your community?", %w(No Yes))

         if q8 == "Yes"
          Community.find_by(location: q5[0] ,title: q5[1]).destroy
          binding.pry
          puts "Congrats your community is no more."
         elsif q8 == "No"
          run_program
         end
      end
    end




   elsif type == "Exit"
     exit

  end
end
    # Able to choose whether you want to join an existing league or to create a new one

    # If you want to join... be able to choose where you would like to choose
    # If you choose to create, you go back to the first.
run_program
