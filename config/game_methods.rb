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

def goodbye
  puts "Goodbye!"
  sleep(3)
  system "clear"
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
    end
    if answer == 1
      if current_user.preference == "Female"
        puts "Nikki: 'Oh, hi! You must be new here. My name is Nikki. I'm in accounting! Nice to meet you.'"
        sleep(2)
      else
        puts "John: 'Hey there. Welcome to hell.'"
        sleep(2)
      end
      work(current_user)
    elsif answer == 2
      if current_user.preference == "Female"
        puts "Princess: 'Excuse me. I'm using the squat rack. Wait your turn."
        sleep(2)
      else
        puts "Fabio: *grunts*"
        sleep(2)
      end
      gym(current_user)
    elsif answer == 3
      if current_user.preference == "Female"
        puts "Kira: 'Hello!! I'm Kira!! Sorry it's a mess in here..."
        sleep(2)
      else
        puts "Oliver: 'Hi newbie! Welcome!!'"
        sleep(2)
      end
      volunteer(current_user)
    elsif answer == 4
      if current_user.preference == "Female"
        puts "Penelope: 'Welcome to the library. Do you need to sign up for a new card?'"
        sleep(2)
      else
        puts "Ryan: '...'"
        sleep(2)
      end
      study(current_user)
    end
  end
  puts "Wow, today was tiring. Time to go to bed."
  sleep(2)
  next_day(current_user)
end

def next_day(current_user)
  count = 1.5
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
    elsif answer == 5
      flirt(current_user)
    elsif answer == 6
      date(current_user)
    elsif answer == 7
      return welcome
    end
  end
  puts "Wow, today was tiring. Time to go to bed."
  sleep(2)
  next_day(current_user)
end

def work(current_user)
  puts "Another day, another dollar."
  sleep(2)
  current_user.money += 200
  current_user.save
  display_stats(current_user)
end

def gym(current_user)
  puts "I'm so sore."
  sleep(2)
  current_user.fitness += 10
  current_user.save
  display_stats(current_user)
end

def volunteer(current_user)
  puts "The shelter looks slighter nicer now!"
  sleep(2)
  current_user.kindness += 10
  current_user.save
  display_stats(current_user)
end

def study(current_user)
  puts "Ugh... Learning Active Record is confusing..."
  sleep(2)
  current_user.intellect += 10
  current_user.save
  display_stats(current_user)
end



def flirt(current_user)
  prompt = TTY::Prompt.new
  male_choices = Lover.all.select { |obj| obj.gender == "Male"}.map { |males| males.name }
  female_choices = Lover.all.select { |obj| obj.gender == "Female"}.map { |females| females.name }

  if current_user.preference == "Male"
    mchoice = prompt.select("Who do you want to flirt with?", male_choices)
    choice_id = Lover.all.find { |lovers| lovers.name == mchoice }
    Dates.create(user_id: current_user, lovers_id: choice_id, affection_pts: 10 )
    puts "#{prompt_facts(choice_id)}"
    sleep(2)
    puts "You got to know #{mchoice} better."
    sleep(2)
  elsif current_user.preference == "Female"
    fchoice = prompt.select("Who do you want to flirt with?", female_choices)
    choice_id = Lover.all.find { |lovers| lovers.name == fchoice }
    Dates.create(user_id: current_user, lovers_id: choice_id, affection_pts: 10 )
    puts "#{prompt_facts(choice_id)}"
    sleep(2)
    puts "You got to know #{fchoice} better."
    sleep(2)
  end
end

def date(current_user)
  if current_user.preference == "Male"
    male_date(current_user)
  elsif current_user.preference == "Female"
    female_date(current_user)
  end
end

def male_date (current_user)
  prompt = TTY::Prompt.new
  male_choices = Lover.all.select { |obj| obj.gender == "Male"}.map { |males| males.name }
  mchoice = prompt.select("Who do you want to go on a date with?", male_choices)
  choice_id = Lover.all.find { |lovers| lovers.name == mchoice }
  if  current_user.fitness >= choice_id.fitness_req && current_user.intellect >= choice_id.intellect_req && current_user.kindness >= choice_id.kindness_req && current_user.money >= choice_id.money_req
    Dates.create(user_id: current_user, lovers_id: choice_id, affection_pts: 50 )
    current_user.money -= choice_id.money_req
    current_user.save
    puts "You got to know #{mchoice} better."
  else
    puts "#{mchoice} doesn't seem interested in going on a date with you."
  end
  sleep(2)
  display_stats(current_user)
end

def female_date(current_user)
  prompt = TTY::Prompt.new
  female_choices = Lover.all.select { |obj| obj.gender == "Female"}.map { |females| females.name }
  fchoice = prompt.select("Who do you want to go on a date with?", female_choices)
  choice_id = Lover.all.find { |lovers| lovers.name == fchoice }
  if current_user.fitness >= choice_id.fitness_req && current_user.intellect >= choice_id.intellect_req && current_user.kindness >= choice_id.kindness_req && current_user.money >= choice_id.money_req
    Dates.create(user_id: current_user, lovers_id: choice_id, affection_pts: 50 )
    current_user.money -= choice_id.money_req
    current_user.save
    puts "You got to know #{fchoice} better."
  else
    puts "#{fchoice} doesn't seem interested in going on a date with you."
  end
  sleep(2)
  display_stats(current_user)
end

def prompt_facts(choice_id)
  facts = [choice_id.fact_food, choice_id.fact_item, choice_id.fact_place, choice_id.fact_color, choice_id.fact_dream, choice_id.fact_season]
  facts.sample
end

def affection_pts(current_user, current_lover)
  fitness_mod = current_user.fitness * current_lover.aff_fitness_mod
  intellect_mod = current_user.intellect * current_lover.aff_intellect_mod
  kindness_mod = current_user.kindness * current_lover.aff_kindness_mod
  money_mod = current_user.money * current_lover.aff_money_mod
  aff_pts = (fitness_mod + intellect_mod + kindness_mod + money_mod)/3
end
