

#---------------------------- Main Menu --------------------------------#
def banner
  puts "

  ███████╗██╗      █████╗ ████████╗██╗██████╗  ██████╗ ███╗   ██╗
  ██╔════╝██║     ██╔══██╗╚══██╔══╝██║██╔══██╗██╔═══██╗████╗  ██║
  █████╗  ██║     ███████║   ██║   ██║██████╔╝██║   ██║██╔██╗ ██║
  ██╔══╝  ██║     ██╔══██║   ██║   ██║██╔══██╗██║   ██║██║╚██╗██║
  ██║     ███████╗██║  ██║   ██║   ██║██║  ██║╚██████╔╝██║ ╚████║
  ╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝

  ██████╗  █████╗ ████████╗██╗███╗   ██╗ ██████╗     ███████╗██╗███╗   ███╗
  ██╔══██╗██╔══██╗╚══██╔══╝██║████╗  ██║██╔════╝     ██╔════╝██║████╗ ████║
  ██║  ██║███████║   ██║   ██║██╔██╗ ██║██║  ███╗    ███████╗██║██╔████╔██║
  ██║  ██║██╔══██║   ██║   ██║██║╚██╗██║██║   ██║    ╚════██║██║██║╚██╔╝██║
  ██████╔╝██║  ██║   ██║   ██║██║ ╚████║╚██████╔╝    ███████║██║██║ ╚═╝ ██║
  ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚══════╝╚═╝╚═╝     ╚═╝

  "
  sleep(3)
  system "clear"
end

def welcome
  main_menu = [
    {"New Game" => -> do new_game end },
    {"Load Game" => -> do load_game end},
    {"Delete File" => -> do delete_file end},
    {"Exit" => -> do goodbye end}]
  prompt = TTY::Prompt.new
  response = prompt.select("Welcome to the Flatiron Dating Sim!", main_menu)
  puts "jesus was here"
end

def new_game
  puts "What is your name?"
  name = gets.chomp
  prompt = TTY::Prompt.new
  preference = prompt.select("What is your sexual preference?", %w(Male Female Both))
  current_user = User.create(name: name, preference: preference,
    fitness: rand(0..15), intellect: rand(0..15), kindness: rand(0..15),
    money: 100, total_days: 0, work_days: 0, volunteer_days: 0, total_dates: 0, gym_days: 0, study_days: 0)
    goal_message
    display_stats(current_user)
    sleep(2)
    system "clear"
    day(current_user)
  end

def goodbye
  puts "Goodbye!"
  sleep(2)
  system "clear"
  exit
end

def load_game
  user_choices = User.all.map{ |obj| obj.name}
  prompt = TTY::Prompt.new
  choice = prompt.select("Choose a file", user_choices)
  current_user = User.all.find { |obj| obj.name == choice}
  puts "You've chosen #{current_user.name}"
  if current_user.total_days == 0
    system "clear"
    goal_message
  end
  day(current_user)
end

  def delete_file
    users = User.all.map { |obj| obj.name}
    prompt = TTY::Prompt.new
    delete_choice = prompt.select("Choose a file to delete", users)
    deleting = User.all.find { |obj| obj.name == delete_choice}
    deleting.destroy
    puts "File has been deleted."
    sleep(1)
    system "clear"
    welcome
  end

#---------------------------- Day Loops --------------------------------#

def day(current_user)
  choices = [
    {name: 'Go to work', value: 1},
    {name: 'Hit the gym', value: 2},
    {name: 'Volunteer', value: 3},
    {name: 'Study at the library', value:4},
    {name: 'Text someone', value: 5},
    {name: 'Go on a date', value: 6},
    {name: 'Exit', value: 7}]
  if current_user.total_days == 0
    choices[4][:disabled] = "(You haven't met anyone to talk to!)"
    choices[5][:disabled] = "(You haven't met anyone to talk to!)"
  end

  display_stats(current_user)

  prompt = TTY::Prompt.new
  answer = prompt.select("Day #{current_user.total_days + 1} - What do you want to do?", choices)
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
    check = date(current_user)
  elsif answer == 7
    return welcome
  end

  current_user.total_days += 1

  if current_user.total_days == 5
    check = lose_game(current_user)
  end
  
  sleep(1)
  puts "Wow, today was tiring. Time to go to bed!"
  sleep(1)
  if check == "won" || check == "lose"

    welcome
  else
    day(current_user)
  end
end
#---------------------------- Action Methods --------------------------------#


def work(current_user)
  if current_user.work_days == 0
    if current_user.preference == 'Both'
      lover = Lover.all.select { |lovers| lovers.interest == "money" }
      puts "You have met #{lover[0].name} & #{lover[1].name}!"
      puts lover[0].first_meeting
      puts lover[1].first_meeting
      sleep(1)
    else
      lover = Lover.all.find {|lovers|lovers.gender == current_user.preference && lovers.interest == "money"}
      puts "You have met #{lover.name}!"
      puts lover.first_meeting
      sleep(1)
    end
  end
  puts "Another day, another dollar."
  sleep(1)
  current_user.money += 200
  current_user.save
  display_stats(current_user)
  current_user.work_days += 1
end

def gym(current_user)
  if current_user.gym_days == 0
    if current_user.preference == 'Both'
      lover = Lover.all.select { |lovers| lovers.interest == "fitness" }
      puts "You have met #{lover[0].name} & #{lover[1].name}!"
      puts lover[0].first_meeting
      puts lover[1].first_meeting
      sleep(2)
    else
      lover = Lover.all.find {|lovers| lovers.gender == current_user.preference && lovers.interest == "fitness"}
      puts "You have met #{lover.name}!"
      puts lover.first_meeting
      sleep(2)
    end
  end
  puts "I'm so sore."
  sleep(1)
  current_user.fitness += 10
  current_user.save
  display_stats(current_user)
  current_user.gym_days += 1
end

def volunteer(current_user)
  if current_user.volunteer_days == 0
    if current_user.preference == 'Both'
      lover = Lover.all.select { |lovers| lovers.interest == "volunteering" }
      puts "You have met #{lover[0].name} & #{lover[1].name}!"
      puts lover[0].first_meeting
      puts lover[1].first_meeting
      sleep(1)
    else
      lover = Lover.all.find {|lovers|lovers.gender == current_user.preference && lovers.interest == "volunteering"}
      puts "You have met #{lover.name}!"
      puts lover.first_meeting
      sleep(1)
    end
  end
  puts "The shelter looks slighter nicer now!"
  sleep(1)
  current_user.kindness += 10
  current_user.save
  display_stats(current_user)
  current_user.volunteer_days += 1
end

def study(current_user)
  if current_user.study_days == 0
    if current_user.preference == 'Both'
      lover = Lover.all.select { |lovers| lovers.interest == "intellect" }
      puts "You have met #{lover[0].name} & #{lover[1].name}!"
      puts lover[0].first_meeting
      puts lover[1].first_meeting
      sleep(1)
    else
      lover = Lover.all.find {|lovers|lovers.gender == current_user.preference && lovers.interest == "intellect"}
      puts "You have met #{lover.name}!"
      puts lover.first_meeting
      sleep(1)
    end
  end
  puts "Ugh... Learning Active Record is confusing..."
  sleep(1)
  current_user.intellect += 10
  current_user.save
  display_stats(current_user)
  current_user.study_days += 1
end

def flirt(current_user)
  prompt = TTY::Prompt.new
  male_choices = Lover.all.select { |obj| obj.gender == "Male"}.map { |males| males.name }
  female_choices = Lover.all.select { |obj| obj.gender == "Female"}.map { |females| females.name }
  all_choices = Lover.all.map { |lovers| lovers.name }

  if current_user.preference == "Male"
    mchoice = prompt.select("Who do you want to flirt with?", male_choices)
    choice_id = Lover.all.find { |lovers| lovers.name == mchoice }
    pts = affection_pts(current_user, choice_id)
    Dates.create(user_id: current_user.id, lovers_id: choice_id.id, affection_pts: pts/2 )
    puts "#{prompt_facts(choice_id)}"
    sleep(1)
    puts "You got to know #{mchoice} better."
    sleep(1)
  elsif current_user.preference == "Female"
    fchoice = prompt.select("Who do you want to flirt with?", female_choices)
    choice_id = Lover.all.find { |lovers| lovers.name == fchoice }
    pts = affection_pts(current_user, choice_id)
    Dates.create(user_id: current_user.id, lovers_id: choice_id.id, affection_pts: pts/2 )
    puts "#{prompt_facts(choice_id)}"
    sleep(1)
    puts "You got to know #{fchoice} better."
    sleep(1)
  elsif current_user.preference == "Both"
    achoice = prompt.select("Who do you want to flirt with?", all_choices)
    choice_id = Lover.all.find { |lovers| lovers.name == achoice }
    pts = affection_pts(current_user, choice_id)
    Dates.create(user_id: current_user.id, lovers_id: choice_id.id, affection_pts: pts/2 )
    puts "#{prompt_facts(choice_id)}"
    sleep(1)
    puts "You got to know #{achoice} better."
    sleep(1)
  end
end

def date(current_user)
  current_user.total_dates += 1
  if current_user.preference == "Male"
    return male_date(current_user)

  elsif current_user.preference == "Female"
    return female_date(current_user)
  else
    return both_date(current_user)
  end
end

#---------------------------- Helper Methods --------------------------------#

def prompt_facts(choice_id)
  facts = [choice_id.fact_food, choice_id.fact_item, choice_id.fact_place, choice_id.fact_color, choice_id.fact_dream, choice_id.fact_season]
  facts.sample
end

def goal_message
  puts "Hey there!"
  sleep(1)
  puts "Welcome to the Flatiron School, we're really glad to have you!"
  sleep(1)
  puts "There is going to be a school dance in exactly..."
  sleep(1)
  puts "40 DAYS!!!??"
  sleep(1)
  puts "You need to find a date to go with!!"
  puts "Good luck!!"
  sleep(3)
  system "clear"
end

def display_stats(current_user)
  puts "Here are your stats.
  Fitness: #{current_user.fitness}
  Intellect: #{current_user.intellect}
  Kindness: #{current_user.kindness}
  Money: $#{current_user.money}"
end

def affection_pts(current_user, current_lover)
  fitness_mod = current_user.fitness * current_lover.aff_fitness_mod
  intellect_mod = current_user.intellect * current_lover.aff_intellect_mod
  kindness_mod = current_user.kindness * current_lover.aff_kindness_mod
  money_mod = current_user.money / current_lover.aff_money_mod
  aff_pts = (fitness_mod + intellect_mod + kindness_mod + money_mod)/5
end

def male_date (current_user)
  prompt = TTY::Prompt.new
  male_choices = Lover.all.select { |obj| obj.gender == "Male"}.map { |males| males.name }
  mchoice = prompt.select("Who do you want to go on a date with?", male_choices)
  choice_id = Lover.all.find { |lovers| lovers.name == mchoice }
  pts = affection_pts(current_user, choice_id)
  if  current_user.fitness >= choice_id.fitness_req && current_user.intellect >= choice_id.intellect_req && current_user.kindness >= choice_id.kindness_req && current_user.money >= choice_id.money_req
    Dates.create(user_id: current_user.id, lovers_id: choice_id.id, affection_pts: pts )
    current_user.money -= choice_id.money_req
    current_user.save
    if aff_dates_sum(current_user.id, choice_id.id) >= choice_id.aff_pts_req
        puts "Yay you got a significant other!"
        #endgame method
        return endgame(current_user, choice_id)
    else
      puts "You got to know #{mchoice} better."
    end
  else
    puts "#{mchoice} doesn't seem interested in going on a date with you."
  end
  sleep(1)
  display_stats(current_user)
end

def female_date(current_user)
  prompt = TTY::Prompt.new
  female_choices = Lover.all.select { |obj| obj.gender == "Female"}.map { |females| females.name }
  fchoice = prompt.select("Who do you want to go on a date with?", female_choices)
  choice_id = Lover.all.find { |lovers| lovers.name == fchoice }
  pts = affection_pts(current_user, choice_id)
  if current_user.fitness >= choice_id.fitness_req && current_user.intellect >= choice_id.intellect_req && current_user.kindness >= choice_id.kindness_req && current_user.money >= choice_id.money_req
    Dates.create(user_id: current_user.id, lovers_id: choice_id.id, affection_pts: pts )
    current_user.money -= choice_id.money_req
    current_user.save
    if aff_dates_sum(current_user.id, choice_id.id) >= choice_id.aff_pts_req
        puts "Yay you got a significant other!"
        #endgame method
        return endgame(current_user, choice_id)
    else
      puts "You got to know #{fchoice} better."
    end
  else
    puts "#{fchoice} doesn't seem interested in going on a date with you."
  end
  sleep(1)
  display_stats(current_user)
end

def both_date(current_user)
  prompt = TTY::Prompt.new
  all_choices = Lover.all.map { |lovers| lovers.name }
  achoice = prompt.select("Who do you want to go on a date with?", all_choices)
  choice_id = Lover.all.find { |lovers| lovers.name == achoice }
  pts = affection_pts(current_user, choice_id)
  if  current_user.fitness >= choice_id.fitness_req && current_user.intellect >= choice_id.intellect_req && current_user.kindness >= choice_id.kindness_req && current_user.money >= choice_id.money_req
    Dates.create(user_id: current_user.id, lovers_id: choice_id.id, affection_pts: pts )
    current_user.money -= choice_id.money_req
    current_user.save
    if aff_dates_sum(current_user.id, choice_id.id) >= choice_id.aff_pts_req
        puts "#{choice_id.name} wants to be exclusive with you."
        endgame(current_user, choice_id)
    else
      puts "You got to know #{achoice} better."
    end
  else
    puts "#{achoice} doesn't seem interested in going on a date with you."
  end
  sleep(1)
  display_stats(current_user)
end

def aff_dates_sum(user, lover)
  sum = Dates.where("user_id = #{user} and lovers_id = #{lover}").sum(:affection_pts)
  sum
end

def lose_game(current_user)
  system "clear"
  sleep(3)
  puts "Wow..."
  sleep(1)
  puts "Today's the day of Prom and you couldn't find a date..."
  sleep(1)
  puts "What's the point of even going alone?"
  sleep(1)
  puts "You're such a loser!!"
  sleep(1)
  puts "You'll never live this down"
  sleep(1)
  options = [
    {"Reset Game?" => -> do reset_character(current_user) end },
    {"Delete File" => -> do delete_self(current_user) end}]
  prompt = TTY::Prompt.new
  response = prompt.select("What will do you?", options)
  puts "Let's try this again."
  sleep(3)
  system "clear"
  welcome
end

def endgame(current_user, lover)
  system "clear"
  puts "Congratulations! You found someone to go to Prom with!"
  puts "It took you
  #{current_user.total_days} total days consisting of
  #{current_user.work_days} work days
  #{current_user.volunteer_days} volunteer days
  #{current_user.gym_days} gym days
  #{current_user.study_days} study days
  #{current_user.total_dates} total dates
  to end up with #{lover.name}"
  puts "Thank you for playing Flatiron Dating Sim!"
  sleep(3)
  reset_character(current_user)
  sleep(4)
  return "won"
end

# def lose_game(current_user)
#   puts "Aw man! you ran out of time... better luck next time"
#   #calltheresetmethod
#   reset_character(current_user)
#   return "lose"
# end

def reset_character(current_user)
  User.update(current_user.id, fitness: rand(0..15), intellect: rand(0..15), kindness: rand(0..15),
    money: 100, total_days: 0, work_days: 0, volunteer_days: 0, total_dates: 0, gym_days: 0, study_days: 0)
  puts "You can continue to play the game, but your stats have been reset."
end

def delete_self(current_user)
  User.find(current_user.id).destroy
  puts "Your file has been deleted"
end
