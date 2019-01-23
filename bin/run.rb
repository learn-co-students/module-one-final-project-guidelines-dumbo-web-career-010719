require_relative '../config/environment'
require_relative 'methods'
require 'pry'

puts"__      _____ _    ___ ___  __  __ ___   _____ ___    ___ _____ ___   ___ _  __  _   _ ___ _
     \ \    / / __| |  / __/ _ \|  \/  | __| |_   _/ _ \  / __|_   _/ _ \ / __| |/ / | | | | _ \ |
      \ \/\/ /| _|| |_| (_| (_) | |\/| | _|    | || (_) | \__ \ | || (_) | (__| ' <  | |_| |  _/_|
       \_/\_/ |___|____\___\___/|_|  |_|___|   |_| \___/  |___/ |_| \___/ \___|_|\_\  \___/|_| (_)"


$prompt = TTY::Prompt.new
user_input = $prompt.select("Main Menu") do |menu|
  menu.choice 'Sign_In', -> {username = returning_user?
  zip = get_user_zip
  my_store = find_user_store(zip)
  my_store_items = store_items(my_store)
  my_item = find_by_item_name(my_store_items)}
  menu.choice 'View_Cart', -> {view_current_cart}
  menu.choice 'View_Local_Stores', -> {username = returning_user?
    zip = get_user_zip
    view_local_stores(zip)}
  menu.choice 'Add_Items_To_Cart', -> {username = returning_user?
  zip = get_user_zip
  my_store = find_user_store(zip)
  my_store_items = store_items(my_store)
  my_item = find_by_item_name(my_store_items)}
  menu.choice 'Delete_Account', -> {delete_account}
end


puts "HELLO WORLD"
