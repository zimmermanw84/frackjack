class Game < ActiveRecord::Base
  # Remember to create a migration!
  attr_reader :dealer_hand, :player_hand, :deck

  def initialize(args={})
    super
    @deck = Card.all
    @muck = []
    @player_hand = []
    @dealer_hand = []
    shuffle!
    # deal
  end

  def shuffle!
    @deck = @muck + @deck
    @deck = @deck.shuffle
  end

  def deal
    @player_hand << @deck.to_a.pop
    @dealer_hand << @deck.to_a.pop
    @player_hand << @deck.to_a.pop
    @dealer_hand << @deck.to_a.pop
  end

  def hit!(hand)
    hand << @deck.to_a.pop
  end

end
