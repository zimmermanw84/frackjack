class Game < ActiveRecord::Base
  # Remember to create a migration!

  belongs_to :user

  has_many :decks
  has_many :cards, through: :decks


end
