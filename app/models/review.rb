class Review < ActiveRecord::Base
  validates_presence_of :title, :director, :fav_character, :description, :rating
  belongs_to :user
end
