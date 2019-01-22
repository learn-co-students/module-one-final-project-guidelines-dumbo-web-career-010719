require_relative '../config/environment'
require 'tty-prompt'

def banner
  puts " ______   __         ______     ______   __     ______     ______     __   __ "
  puts "/\  ___\ /\ \       /\  __ \   /\__  _\ /\ \   /\  == \   /\  __ \   /\ -.\ \ "
  puts "\ \  __\ \ \ \____  \ \  __ \  \/_/\ \/ \ \ \  \ \  __<   \ \ \/\ \  \ \ \-.  \ "
  puts " \ \_\    \ \_____\  \ \_\ \_\    \ \_\  \ \_\  \ \_\ \_\  \ \_____\  \ \_\\\_\  "
  puts "  \/_/     \/_____/   \/_/\/_/     \/_/   \/_/   \/_/ /_/   \/_____/   \/_/ \/_/  "
  puts""
  puts "_____     ______     ______   __     __   __     ______        ______     __     __    __ "
  puts "/\  __-.  /\  __ \   /\__  _\ /\ \   /\ -.\ \   /\  ___\      /\  ___\   /\ \   /\ -./  \ "
  puts"\ \ \/\ \ \ \  __ \  \/_/\ \/ \ \ \  \ \ \-.  \  \ \ \__ \     \ \___  \  \ \ \  \ \ \-./\ \  "
  puts " \ \____-  \ \_\ \_\    \ \_\  \ \_\  \ \_\\\_\  \ \_____\     \/\_____\  \ \_\  \ \_\ \ \_\ "
  puts " \/____/   \/_/\/_/     \/_/   \/_/   \/_/ \/_/   \/_____/      \/_____/   \/_/   \/_/  \/_/ "

  sleep(2)
  system "clear"
end

def welcome
  prompt = TTY::Prompt.new
  response = prompt.select("Welcome to the Flatiron Dating Sim!", %w(new_game load_game delete_file exit))
  if response == 'new_game'
    new_game
  elsif response == 'load_game'
    load_game
  elsif response == 'delete_file'
    delete_file
  elsif response == 'exit'
    puts "Goodbye"
  end
end


banner
welcome
