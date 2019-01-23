require 'pry'

def main_menu
  $prompt = TTY::Prompt.new
  user_input = $prompt.select("Main Menu") do |menu|
    menu.choice 'Sign In/Create Account', -> {username = returning_user?
    zip = get_user_zip
    my_store = find_user_store(zip)
    my_store_items = store_items(my_store)
    my_item = find_by_item_name(my_store_items)}
    menu.choice 'View Cart', -> {view_current_cart}
    menu.choice 'View Local Stores', -> {username = returning_user?
      zip = get_user_zip
      view_local_stores(zip)}
    menu.choice 'Add Items To Cart', -> {username = returning_user?
    zip = get_user_zip
    my_store = find_user_store(zip)
    my_store_items = store_items(my_store)
    my_item = find_by_item_name(my_store_items)}
    menu.choice 'Delete Item From_Cart', -> {username = returning_user?
    zip = get_user_zip
    my_store = find_user_store(zip)
    my_store_items = store_items(my_store)
    delete_item_from_cart}
    menu.choice 'Pick Up Reserved Items', -> {pick_up_items}
    menu.choice 'Delete Account', -> {delete_account}
    menu.choice 'Exit', -> {exit}
  end
end

$username = ""
def returning_user?
  puts "Are you a returning or a new user?"
  user_input = gets.chomp
  if user_input == "returning"
    username = access_username(user_input)
  elsif user_input == "new"
    puts "Awesome! Welcome!"
    username = create_username(user_input)
  else
    puts "Please enter whether you are 'returning' or 'new':"
    returning_user?
  end
  $username = username
end

def exists?(user_input)
  usernames_arr = User.all.map {|user| user.username}
  if usernames_arr.include?(user_input)
    true
  else
    false
  end
end

def access_username(user_input)
  puts "Welcome back! Please enter your username:"
  user_input = gets.chomp
  if exists?(user_input)
    puts "Hey #{user_input}!"
    username = user_input
  else
    puts "Username does not exist. Please try again."
    access_username(user_input)
    username = user_input
  end
end

def create_username(user_input)
  puts "Please enter a username:"
  user_input = gets.chomp
  while exists?(user_input)
    puts "Username already exists. Please be more creative:"
    user_input = gets.chomp
  end
  puts "That username is not taken! Please enter your first name:"
  user_first_name = gets.chomp
  puts "Shweeeet! Now enter your zipcode:"
  user_zip_code = gets.chomp
  User.create(username: user_input, name: user_first_name, location: user_zip_code)
end

def get_user_zip
  puts "What is your zipcode:"
  user_input = gets.chomp
end

$my_store = []
def find_user_store(zip)
  store_locations = Store.all.map {|store| store.location}
  my_store_zip = store_locations.find {|location| location == zip}
  while my_store_zip.nil?
    puts "We have not yet expanded to your location. Try another zip code!"
    zip = get_user_zip
    my_store_zip = find_user_store(zip)
  end
  $my_store = Store.all.select {|store| store.location == my_store_zip}
end

def store_items(my_store)
  my_store_items = my_store.map {|store| store.items}.flatten
end

def find_by_item_name(my_store_items)
  puts "What item are you looking for today?"
  user_input = gets.chomp.capitalize
  my_item = my_store_items.find {|item| item.name == user_input}
  while my_item.nil?
    puts "We do not currently carry that item. Please enter another item name:"
    user_input = gets.chomp.capitalize
    my_item = my_store_items.find {|item| item.name == user_input}
  end
  puts "Yay! We carry that item!"
  if my_item.quantity > 0 && my_item.in_stock?
    puts "Would you like to add this item to your cart?"
    user_answer = gets.chomp.capitalize
    if user_answer == "Yes"
      add_to_cart(my_item)
    elsif user_answer == "No"
      puts "Okay. Would you like to search for another item?"
      find_by_item_name(my_store_items)
    else
      puts "Huh?"
      find_by_item_name(my_store_items)
    end
  else
    puts "Sorry, this item is temporarily out of stock :("
    find_by_item_name(my_store_items)
  end
end

def add_to_cart(my_item)
  user = User.all.find {|user| user.username == $username}
  prompt = TTY::Prompt.new
  item_quantity = prompt.ask("How many would you like to add to your cart: 0-#{my_item.quantity}?") { |q| q.in('0-100') }
  if my_item.quantity >= item_quantity.to_i && item_quantity.to_i > 0
    item_cart = Cart.all.find {|cart| cart.item_id == my_item.id}
    if item_cart.nil?
      Cart.create(item_id: my_item.id, user_id: user.id, quantity: item_quantity)
    else
      item_cart.quantity += item_quantity.to_i
      item_cart.save
    end
    my_item.quantity -= item_quantity.to_i
    my_item.save
  elsif item_quantity.to_i == 0
    prompt = TTY::Prompt.new
    user_input = prompt.yes?('Did you want to search for another item?')
    if user_input == true
      zip = get_user_zip
      my_store = find_user_store(zip)
      my_store_items = store_items(my_store)
      my_item = find_by_item_name(my_store_items)
    else
      exit
    end
  else
    puts "Sorry, we only have #{my_item.quantity} currently in stock."
    prompt = TTY::Prompt.new
    item_quantity = prompt.ask("How many would you like to add to your cart: 0-#{my_item.quantity}?") { |q| q.in('0-100') }
    if my_item.quantity >= item_quantity.to_i && item_quantity.to_i > 0
      item_cart = Cart.all.find {|cart| cart.item_id == my_item.id}
      if item_cart.nil?
        Cart.create(item_id: my_item.id, user_id: user.id, quantity: item_quantity)
      else
        item_cart.quantity += item_quantity.to_i
        item_cart.save
      end
      my_item.quantity -= item_quantity.to_i
      my_item.save
    end
  end
  main_menu
end

def view_current_cart
  puts "Welcome back! Please enter your username:"
  username = gets.chomp
  my_user = User.all.find {|user| user.username == username}
  my_user_id = my_user.id
  my_carts = Cart.all.select {|cart| cart.user_id == my_user_id}
  my_cart_item_ids = my_carts.map {|cart| cart.item_id}
  message = "You currently have: "
  my_carts.each do |cart|
      message << " #{cart.quantity} - #{Item.find(cart.item_id).name},"
  end
  puts message
  main_menu
end

def view_local_stores(zip)
  Store.all.select do |store|
    if store.location == zip
      all_local_store = store.name
      puts all_local_store
    end
  end
  main_menu
end

def delete_item_from_cart
  puts "What item would you like to delete?"
  user_answer = gets.chomp.capitalize
  me = User.all.find{|user| user.username == $username}
  my_carts = Cart.all.select {|cart| cart.user_id == me.id}
  my_carts.each do |cart|
    if user_answer == "#{Item.find(cart.item_id).name}"
      cart.delete
    end
  end
  main_menu
end

def pick_up_items
  puts "Thanks for STOCKING UP! Your order will be ready for pickup at your local store!"
end

def delete_account
  puts "Sorry to hear you're leaving us! Please enter your username:"
  username = gets.chomp
  if exists?(username)
    puts "Goodbye #{username}!"
    User.find do |users|
      if users.username == username
        users.delete
      end
    end
  end
  main_menu
end

def exit
  puts "Thanks for STOCKING UP! Goodbye!"
end
