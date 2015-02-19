class Card < ActiveRecord::Base
  belongs_to :deck
  belongs_to :game
  # Remember to create a migration!
end
