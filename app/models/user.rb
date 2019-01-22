class User < ActiveRecord::Base
  has_many :movies, through :movieslist
  has_many :movieslist
end
