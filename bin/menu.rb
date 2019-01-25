require_relative '../config/environment'
require_relative '../app/model/character'
require_relative '../app/model/inventory'
require_relative '../app/model/item'

#character's menu
class Menu
    #Main menu
    def self.main_menu
        Menu.pause
        Menu.intro_music
        puts
        loop do
            choose do |menu|
                puts "Main Menu"
                menu.prompt = "Pick an option"
                menu.choice("Create Character"){Character.create_character() }
                menu.choice("Select Character") {Character.load()}
                menu.choice("Delete Character"){Character.delete_char()}
                menu.choice(:Quit, "Exit game.") { exit }
            end
        end
    end

    #In-Game menu
    def self.game_menu
        Menu.pause
        Menu.game_music
        puts
        loop do
          choose do |menu|
            puts "Character Menu"
            menu.prompt = "Pick an option"
            menu.choice("Change character name"){Character.update_character_name()}
            menu.choice("Create Item") { Item.generate_new_item()}#
            menu.choice("Show character inventory") {Inventory.char_inventory()}#can do better
            menu.choice("Drop Item"){Item.delete_item()}
            menu.choice("Back to Main Menu") { main_menu }
          end 
        end
    end

    def self.intro_music
        @player = Audite.new
        @player.load('music/Intro.mp3')
        @player.start_stream
    end

    def self.game_music
        @player2 = Audite.new
        @player2.load('music/Ellinia.mp3')
        @player2.start_stream
    end

    def self.pause
        @player.stop_stream
        @player2.stop_stream
    end
end