class Dates < ActiveRecord::Base
  belongs_to :user
  belongs_to :lover
  # attr_accessor :affection_pts
end
