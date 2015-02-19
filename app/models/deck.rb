class Deck < ActiveRecord::Base
  has_many :cards
  has_many :games, through: :cards
  # Remember to create a migration!
end
