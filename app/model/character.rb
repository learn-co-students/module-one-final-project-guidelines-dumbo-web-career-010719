
class Character < ActiveRecord::Base
    has_many :inventories
    has_many :items, through: :inventory

    @@current_char = ""

    #create a new character along with 5 free inventory slots associate with
    def self.create_character
        char_name = ask("Character Name?", String)
        new_char = Character.create(name: char_name)
        @@current_char = new_char
        5.times do
            Inventory.create(char_id: new_char.id)
        end
        puts "You have created #{new_char.name}!"
        Menu.game_menu()
    end
    
    #return all characters
    def self.show_characters
        tp Character.all
    end

    #update a character's name
    def self.update_character_name
        new_name = ask("Choose a name to change to: ", String)
        char_id = Character.current_char.id
        char = Character.find(char_id)
        char.update(name: new_name)
        puts "Your name is now #{char.name}!"
    end
    
    #load a existing character
    def self.load
        if Character.all.count != 0
            Character.show_characters
            q = ask("Choose character: (Please enter character id number)", Integer)
            if Character.all.where(id: q).exists?(conditions = :none)
                @@current_char = Character.find_by(id: q)
                puts "You've selected #{@@current_char.name}!"
                Menu.game_menu()
            else
                puts "Invalid Input."
                Character.load()
            end
        else
            puts "There are no characters to select."
        end
    end

    #return a current character object
    def self.current_char
        @@current_char
    end

    #delete a character along with the inventory associate with 
    def self.delete_char
        if Character.all.count != 0
            Character.show_characters
            q = ask("Choose character: (Please enter character id number)", Integer)
            Inventory.where(char_id: q).destroy_all
            Character.destroy(q)
        else
            puts "There are no characters to delete."
        end 
    end
end
