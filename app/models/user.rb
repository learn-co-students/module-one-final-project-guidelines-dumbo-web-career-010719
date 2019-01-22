class User < ActiveRecord::Base
  has_many :lists
  has_many :movies, through: :lists
  
  def movie_list
    self.lists
  end

  def new_movie(movie_name)
    movie = Movie.find_or_create_by(name: movie_name)
    movie_list.find_or_create_by(user_id: self.id, movie_id: movie.id)
  end

  def get_movie(movie_name)
    Movie.find_by(name: movie_name)
  end

  def update_movie_in_list(movie_name, opts)
    movie_list.find(get_movie(movie_name)).update(opts)
  end

  def delete_movie_in_list(movie_name)
  
  end

end
