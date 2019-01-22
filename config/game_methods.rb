def new_game

  puts "What is your name?"
  name = gets.chomp
  prompt = TTY::prompt.new
  preference = prompt.select("What is your sexual preference?", %w(Male Female))
end


def load_game

end
