require_relative '../config/environment'
require 'active_record'
require 'pry'

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
    inputs = show_menu
    status = true
    check_user(name)

    while status do
        case inputs
        when "1"
            # Show all movies
            puts "Show all movies"
            get_movie_list
        when "2"
            # Add movie to movie list
            add_new_movie
        when "3"
            # View movie info
            view_movie_info
        when "4"
            # Update movie list entry
            update_movie_list_entry
        when "5"
            # Delete movie from movie list
            delete_movie_from_movie_list
        when "exit"
            exit_line
            status = false
        end

        if status == false
            break
        end
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
    puts "exit to exit"

    input = gets.chomp
    return input
end

def exit_line
    puts "C ya"
end

# def check_user(user_name)
#     User.find_or_create_by(name: user_name)
# end

# Get movie list for user
def get_movie_list

end

# Add movie to movie list for user
# Create new movie and add it to movie list
def add_new_movie

end

# View specific movie info
# Takes in movie id?
def view_movie_info

end

# Update entry in movie list
# Takes in movie id?
def update_movie_list_entry

end

# Delete entry in movie list
# Takes in a movie id?
def delete_movie_from_movie_list

end
