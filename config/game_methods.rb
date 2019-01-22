

def new_game

  puts "What is your name?"
  name = gets.chomp
  prompt = TTY::Prompt.new
  preference = prompt.select("What is your sexual preference?", %w(Male Female))
  current_user = User.create(name: name, preference: preference,
    fitness: rand(0..15), intellect: rand(0..15), kindness: rand(0..15),
    money: 100)
  puts "Welcome, #{current_user.name}"
end


def load_game
  users = User.all
  # prompt = TTY::Prompt.new
  # current_user = prompt.select("Choose a file", %w(users))
  users
end
