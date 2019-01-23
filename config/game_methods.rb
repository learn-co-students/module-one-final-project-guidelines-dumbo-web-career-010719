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
      menu.choice 'flirt', 5
      menu.choice 'date', 6
    end
    if answer == 1
      work(current_user)
    elsif answer == 2
      gym(current_user)
    elsif answer == 3
      volunteer(current_user)
    elsif answer == 4
      study(current_user)
    end
  end
  puts "Wow, today was tiring. Time to go to bed."
  sleep(2)
  next_day(current_user)
end

def work(current_user)
  current_user.money += 200
  current_user.save
  display_stats(current_user)
end

def gym(current_user)
  current_user.fitness += 10
  current_user.save
  display_stats(current_user)
end

def volunteer(current_user)
  current_user.kindness += 10
  current_user.save
  display_stats(current_user)
end

def study(current_user)
  current_user.intellect += 10
  current_user.save
  display_stats(current_user)
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
  puts "Hello, #{current_user.name}!"
  display_stats(current_user)
  sleep(2)
  start_day(current_user)
end


def load_game
  user_choices = User.all.map{ |obj| obj.name}
  prompt = TTY::Prompt.new
  choice = prompt.select("Choose a file", user_choices)
  current_user = User.all.find { |obj| obj.name == choice}
  puts "You've chosen #{current_user.name}"
  display_stats(current_user)
  next_day(current_user)
end

def delete_file
  users = User.all.map { |obj| obj.name}
  prompt = TTY::Prompt.new
  delete_choice = prompt.select("Choose a file to delete", users)
  deleting = User.all.find { |obj| obj.name == delete_choice}
  deleting.destroy
  puts "File has been deleted."
  welcome
end

def next_day(current_user)
  count = 0.5
  2.times do
    count += 0.5
    prompt = TTY::Prompt.new
    answer = prompt.select("Day #{count} - What do you want to do?") do |menu|
      menu.enum '.'
      menu.choice 'work', 1
      menu.choice 'gym', 2
      menu.choice 'volunteer', 3
      menu.choice 'study', 4
      menu.choice 'flirt', 5
      menu.choice 'date', 6
      menu.choice 'exit', 7
    end
    if answer == 1
      work(current_user)
    elsif answer == 2
      gym(current_user)
    elsif answer == 3
      volunteer(current_user)
    elsif answer == 4
      study(current_user)
    elsif answer == 7
      return welcome
    end
  end
  puts "Wow, today was tiring. Time to go to bed."
  sleep(2)
  next_day(current_user)
end
