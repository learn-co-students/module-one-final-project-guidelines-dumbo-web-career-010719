class Item < ActiveRecord::Base
    has_many :inventories
    has_many :characters, through: :inventory

    #craft a new item with 33% of chance
    def self.generate_new_item
        if Character.current_char != ""
            item_array=[Item.new(name: "Excalibur", category: "Weapon"),
                        Item.new(name: "Masamune", category: "Weapon"),
                        Item.new(name: "Atlantean", category: "Weapon"),
                        Item.new(name: "Silver Shield", category: "Shield" ),
                        Item.new(name: "Glamdring", category: "Weapon" ), 
                        Item.new(name: "Bronze Shield", category: "Shield"),
                        Item.new(name: "Plate Armor", category: "Armor"),
                        Item.new(name: "Bronz Armor", category: "Armor"),
                        Item.new(name: "Large Potion", category: "Potion"),
                        Item.new(name: "Small Potion", category: "Potion")]
            rand_num =rand(1..10)
            if rand_num.to_i % 3 == 0
                item=item_array.sample
                item.save
                puts "You got #{item.name}!"
                Inventory.add_item_to_inventory(item)
                
            else
                puts "Failed! Try Again."
            end  
        else
            puts "No character has been selected."
        end
    end

    #retrun all items
    def self.show_items
        tp Item.all
    end

    #delete a item from charact inventory
    def self.delete_item
        if Character.current_char != ""
            Inventory.char_inventory
            question = ask("What item would you like to delete? (Choose an id)", Integer)
            Inventory.where(item_id: question).update(item_id: nil)
        else
            puts "No character has been selected."
        end
    end

end