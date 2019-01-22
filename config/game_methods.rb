
def start_day(current_user)
  count = 0.0
  2.times do
    count += 0.5
    prompt = TTY::Prompt.new
    answer = prompt.select("Day #{count} - What do you want to do?") do |menu|
      menu.enum '.'
      menu.choice 'work', 1
      menu.choice 'gym', 2
      menu.choice 'volunteer', 3
      menu.choice 'study', 4
      menu.choice 'chit_chat_girl', 5
      menu.choice 'date', 6
    end
    if answer == 1
      current_user.intellect += 10
      current_user.money += 200
      display_stats(current_user)
    end
  end
end

def display_stats(current_user)
  puts "Here are your stats.
  Fitness: #{current_user.fitness}
  Intellect: #{current_user.intellect}
  Kindness: #{current_user.kindness}
  Money: $#{current_user.money}"
end

def new_game
  puts "What is your name?"
  name = gets.chomp
  prompt = TTY::Prompt.new
  preference = prompt.select("What is your sexual preference?", %w(Male Female))
  current_user = User.create(name: name, preference: preference,
    fitness: rand(0..15), intellect: rand(0..15), kindness: rand(0..15),
    money: 100)
  puts "You've created a new character!"
  display_stats(current_user)
  start_day(current_user)
end


def load_game
  user_choices = User.all.map{ |obj| obj.name}
  prompt = TTY::Prompt.new
  current_user = prompt.select("Choose a file", %w(user_choices))
  puts current_user
end
