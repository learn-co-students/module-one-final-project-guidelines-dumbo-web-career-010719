require_relative '../config/environment'
require 'active_record'

def command_line
    prompts(welcome)
end

def welcome 
    puts "Hello Welcome to My Movie List"
    puts "What is your name?"
    name = gets.chomp
    puts "Hello #{name}"
    return name
end

def prompts(name)
    curr_user = check_user(name)
    inputs = show_menu
    status = true
    
    while status do
        case inputs
        when "1"
            # Show all movies
            puts "Show all movies"
            get_movie_list(curr_user)
        when "2"
            # Add movie to movie list
            add_new_movie(curr_user)
        when "3"
            # View movie info
            view_movie_info(curr_user)
        when "4"
            # Update movie list entry
            update_movie_list_entry(curr_user)
        when "5"
            # Delete movie from movie list
            delete_movie_from_movie_list(curr_user)
        when "6"
            exit_line
            status = false
        end
        
        if status == false
            break
        end
        puts "__________________________________________________"
        inputs = show_menu
    end
end

def show_menu
    puts "Here are your options. Enter a number to navigate"
    puts "1 Show movie list"
    puts "2 Add new movie"
    puts "3 View movie info"
    puts "4 Update movie list entry"
    puts "5 Delete movie from movie list"
    puts "6 exit to exit"

    input = gets.chomp
    return input
end 

def exit_line
    puts "C ya"
end

def check_user(user_name)
    User.find_or_create_by(name: user_name)
end

# Get movie list for user
def get_movie_list(curr_user)
    puts curr_user.movie_list.inspect
end

# Add movie to movie list for user
# Create new movie and add it to movie list
def add_new_movie(curr_user)
    puts "Enter a movie title"
    input = gets.chomp
    puts curr_user.new_movie(input)
    puts "Added #{input} to your list"
end

# View specific movie info
# Takes in movie id?
def view_movie_info(curr_user)
    puts "Enter a movie title"
    input = gets.chomp
    puts "Here is #{input}"
    puts curr_user.get_movie(input)
end

# Update entry in movie list
# Takes in movie id?
def update_movie_list_entry(curr_user)
    puts "Enter a movie title"
    input = gets.chomp
    update_movie_logic(curr_user, input, update_movie_menu)
end

# Delete entry in movie list
# Takes in a movie id?
def delete_movie_from_movie_list(curr_user)

end

def update_movie_menu
    puts "1 to update rating"
    puts "2 to update progress"
    puts "3 to update feedback"
    puts "4 to exit"
    
    input = gets.chomp
    return input
end

def update_movie_logic(curr_user, movie_name, input)
    status = true
    curr_input = input

    while status do
        case curr_input
        when "1"
            puts "enter rating"
            rating = gets.chomp
            curr_user.update_movie_in_list(movie_name, {rating: rating})
        when "2"
            puts "enter progress"
            progress = gets.chomp
             
            if progress == "true"
                curr_user.update_movie_in_list(movie_name, {watched: true})
            else
                curr_user.update_movie_in_list(movie_name, {watched: false})
            end
        when "3"
            puts "enter feedback"
            feedback = gets.chomp
            curr_user.update_movie_in_list(movie_name, {feedback: feedback})
        when "4"
            status = false
            puts "Exit update movie menu"
        end

        if status == false
            break
        end

        curr_input = update_movie_menu
            
    end
end
