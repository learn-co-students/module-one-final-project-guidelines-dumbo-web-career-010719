# require 'pry'
# require 'colorize'
#
# $prompt = TTY::Prompt.new
#
# def first_menu
#   user_input = $prompt.select("Welcome!", active_color: :cyan) do |menu|
#     menu.choice 'Sign In/Create Account', -> {username = returning_user?}
#     menu.choice 'Delete Account', -> {delete_account}
#     menu.choice 'Exit', -> {exit}
#   end
# end
#
# def main_menu
#   user_input = $prompt.select("Main Menu".magenta, active_color: :cyan) do |menu|
#     menu.choice 'View Local Stores', -> {zip = get_user_zip
#       view_local_stores(zip)}
#     menu.choice 'Add Items To Cart', -> {zip = get_user_zip
#       my_store = find_user_store(zip)
#       my_store_items = store_items(my_store)
#       my_item = find_by_item_name(my_store_items)}
#     menu.choice 'View Cart', -> {view_current_cart}
#     menu.choice 'Delete Item From Cart', -> {delete_item_from_cart}
#     menu.choice 'Pick Up Reserved Items', -> {pick_up_items}
#     menu.choice 'Delete Account', -> {delete_account}
#     menu.choice 'Sign Out', -> {exit}
#   end
# end
#
# $username = ""
# def returning_user?
#   user_input = $prompt.select("Are you a New or Returning user?", %w(New Returning), active_color: :magenta)
#   if user_input == "Returning"
#     username = access_username(user_input)
#   else
#     puts "Awesome! Welcome!"
#     username = create_username(user_input)
#   end
#   $username = username
#   main_menu
# end
#
# def exists?(user_input)
#   usernames_arr = User.all.map {|user| user.username}
#   if usernames_arr.include?(user_input)
#     true
#   else
#     false
#   end
# end
#
# def access_username(user_input)
#   user_input = $prompt.ask("Welcome back! Please enter your username:")
#   if exists?(user_input)
#     system "clear"
#     puts "Hey #{user_input}!".green.blink
#     $username = user_input
#   elsif user_input.nil?
#     puts "That is not a valid username. Please try again.".red
#     first_menu
#   else
#     puts "Username does not exist. Please try again.".red
#     access_username(user_input)
#   end
# end
#
# def create_username(user_input)
#   user_input = $prompt.ask("Please enter a username:")
#   while exists?(user_input)
#     user_input = $prompt.ask("Username already exists. Please be more creative:")
#   end
#   user_first_name = $prompt.ask("That username is not taken! Please enter your first name:")
#   User.create(username: user_input, name: user_first_name)
#   system "clear"
#   puts "Welcome #{user_input}!".red.blink
#   $username = user_input
# end
#
# def get_user_zip
#   system "clear"
#   user_input = $prompt.ask("What is your zipcode:")
#   if user_input.nil?
#     puts "Sorry that is not a valid zip code.".red
#   end
# end
#
# $my_store = []
# def find_user_store(zip)
#   store_locations = Store.all.map {|store| store.location}
#   my_store_zip = store_locations.find {|location| location == zip}
#   while my_store_zip.nil?
#     user_input = $prompt.ask("We have not yet expanded to your location. Try another zip code!")
#     zip = get_user_zip
#     my_store_zip = find_user_store(zip)
#   end
#   $my_store = Store.all.select {|store| store.location == my_store_zip}
# end
#
# def store_items(my_store)
#   my_store_items = my_store.map {|store| store.items}.flatten
# end
#
# def find_by_item_name(my_store_items)
#   user_input = $prompt.ask("What item are you looking for today?").capitalize
#   my_item = my_store_items.find {|item| item.name == user_input}
#   while my_item.nil?
#     user_input = $prompt.ask("We do not currently carry that item. Please enter another item name:").capitalize
#     my_item = my_store_items.find {|item| item.name == user_input}
#   end
#   puts "Yay! We carry that item!".blue
#   if my_item.quantity > 0
#     user_answer = $prompt.yes?("Would you like to add this item to your cart?")
#     if user_answer == true
#       add_to_cart(my_item)
#     else
#       user_answer = $prompt.yes?("Okay. Would you like to search for another item?")
#       if user_answer == true
#         find_by_item_name(my_store_items)
#       else
#         main_menu
#       end
#     end
#   else
#     puts "Sorry, this item is temporarily out of stock :(".red
#     find_by_item_name(my_store_items)
#   end
# end
#
# def add_to_cart(my_item)
#   user = User.all.find {|user| user.username == $username}
#   item_quantity = $prompt.ask("How many would you like to add to your cart: 0-#{my_item.quantity}?") { |q| q.in('0-100') }
#   if my_item.quantity >= item_quantity.to_i && item_quantity.to_i > 0
#     item_cart = Cart.all.find {|cart| cart.item_id == my_item.id}
#     if item_cart.nil?
#       Cart.create(item_id: my_item.id, user_id: user.id, quantity: item_quantity)
#     else
#       item_cart.quantity += item_quantity.to_i
#       item_cart.save
#     end
#     my_item.quantity -= item_quantity.to_i
#     my_item.save
#     puts "Your item has been successfully added to your cart!".green.blink
#     sleep(3)
#     system "clear"
#   elsif item_quantity.to_i == 0
#     user_input = $prompt.yes?('Did you want to search for another item?')
#     if user_input == true
#       zip = get_user_zip
#       my_store = find_user_store(zip)
#       my_store_items = store_items(my_store)
#       my_item = find_by_item_name(my_store_items)
#     else
#       main_menu
#     end
#   else
#     puts "Sorry, we only have #{my_item.quantity} currently in stock.".red
#     item_quantity = $prompt.ask("How many would you like to add to your cart: 0-#{my_item.quantity}?") { |q| q.in('0-100') }
#     if my_item.quantity >= item_quantity.to_i && item_quantity.to_i > 0
#       item_cart = Cart.all.find {|cart| cart.item_id == my_item.id}
#       if item_cart.nil?
#         Cart.create(item_id: my_item.id, user_id: user.id, quantity: item_quantity)
#         puts "Your item has been successfully added to your cart!".green.blink
#       else
#         item_cart.quantity += item_quantity.to_i
#         item_cart.save
#       end
#       my_item.quantity -= item_quantity.to_i
#       my_item.save
#     end
#   end
#   main_menu
# end
#
# def view_current_cart
#   if Cart.all.empty?
#     puts "Your cart is currently empty.".red
#   else
#     my_user = User.all.find {|user| user.username == $username}
#     my_user_id = my_user.id
#     my_carts = Cart.all.select {|cart| cart.user_id == my_user_id}
#     my_cart_item_ids = my_carts.map {|cart| cart.item_id}
#     system "clear"
#     message = "You currently have: ".red
#     my_carts.each do |cart|
#         message << " #{cart.quantity} - #{Item.find(cart.item_id).name}"
#     end
#       puts message
#     end
#   main_menu
# end
#
# def view_local_stores(zip)
#   Store.all.select do |store|
#     if store.location == zip
#       all_local_store = store.name
#       puts all_local_store
#     end
#   end
#   main_menu
# end
#
# def delete_item_from_cart
#   me = User.all.find{|user| user.username == $username}
#   my_carts = Cart.all.select {|cart| cart.user_id == me.id}
#   cart_names = []
#   my_carts.each do |carts|
#     Item.select do |items|
#       if carts.item_id == items.id
#         cart_names << items.name
#       end
#     end
#   end
#   system "clear"
#   puts "You currently have: #{cart_names.join(" and ")} in your cart."
#   user_answer = $prompt.ask("What item would you like to delete?").capitalize
#   my_carts.each do |cart|
#     if user_answer == "#{Item.find(cart.item_id).name}"
#       cart.delete
#     end
#   end
#   puts "Your item was successfully deleted.".red
#   main_menu
# end
#
# def clear_cart
#   Cart.delete_all
# end
#
# def pick_up_items
#   system "clear"
#   clear_cart
#   puts "Thanks for STOCKING UP! Your order will be ready for pickup at your local store!".magenta.blink
# end
#
# def delete_account
#   username = $prompt.ask("Sorry to hear you're leaving us! Please enter your username:")
#   if exists?(username)
#     system "clear"
#     puts "Goodbye #{username}!".yellow.blink
#     sleep(5)
#   else
#     puts "Sorry, we could not find that username. Please try again!".red
#     delete_account
#   end
#   User.find do |user|
#     if user.username == username
#       user.delete
#     end
#   end
# end
#
# def exit
#   system "clear"
#   puts "Thanks for STOCKING UP! Goodbye!".magenta.blink
#   clear_cart
# end
