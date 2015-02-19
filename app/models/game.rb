class Game < ActiveRecord::Base
  # Remember to create a migration!
  attr_accessor :deck

  belongs_to :user

  has_many :decks
  has_many :cards, through: :decks


  def shuffle!
  #   # @deck = @muck + @deck
    @deck = self.decks.first.cards.to_a.shuffle
  end


  def set_player_hand
    @player_hand.each do |card|
      card.player_hand = true
      card.save
    end
  end

  def set_dealer_hand
    @dealer_hand.each do |card|
      card.dealer_hand = true
      card.save
    end
  end

  def hit_player!
    @player_hand << @deck.pop
    set_player_hand
  end

  def hit_dealer!
    @dealer_hand << @deck.pop
    set_dealer_hand
  end

  # def delt?
  #   @deck.length < 52 ? true : false
  # end

end
