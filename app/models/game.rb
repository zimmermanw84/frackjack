class Game < ActiveRecord::Base
  # Remember to create a migration!
  attr_accessor :deck

  belongs_to :user

  has_many :decks
  has_many :cards, through: :decks


end
