class Movie < ActiveRecord::Base
  has_many :users, through :movieslist
  has_many :movieslist
end
