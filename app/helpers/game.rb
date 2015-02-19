helpers do

  def load_decks
    @game.decks << Deck.first
  end

  def select_player_dealer_hand

    deck = @game.decks.first.cards.to_a.shuffle
    hands = []

    4.times { hands << deck.pop }

    hands[0..1].each do |card|
      card.player_hand = true
      card.save
    end

    hands[2..3].each do |card|
      card.dealer_hand = true
      card.save
    end
  end

  def dealer_hand
    @game.decks.first.cards.where(dealer_hand: true)
  end

  def player_hand
    @game.decks.first.cards.where(player_hand: true)
  end

  def card_count
    deck = @game.decks.first.cards.where(player_hand: false, dealer_hand: false)
    deck.count
  end

  def hit_player_hand
    deck = @game.decks.first.cards.where(player_hand: false, dealer_hand: false)
    card = deck.sample
    card.player_hand = true
    card.save
  end


  def reset_cards
    Card.all.each do |card|
      card.dealer_hand = false
      card.save
    end

    Card.all.each do |card|
      card.player_hand = false
      card.save
    end
  end

  def player_hand_value
    v = 0
    player_hand.each do |card|
      if card.value == "K"
        v += 10
      elsif card.value == "Q"
        v += 10
      elsif card.value == "J"
        v += 10
      elsif card.value == "A"
        v += 11
      else
        v += card.value.to_i
      end
    end
    v
  end

  def dealer_hand_value
    v = 0
    dealer_hand.each do |card|
      if card.value == "K" || card.value == "Q" || card.value == "J"
        v += 10
      elsif card.value == "A"
        v += 11
      else
        v += card.value.to_i
      end
    end
    v
  end


  def blackjack?

  end

  def dealer_action

  end

  def declare_winner

  end

end