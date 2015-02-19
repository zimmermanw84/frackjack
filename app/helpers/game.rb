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
    player_hand.each { |card| v += card.value }
    v > 21 ? "Bust!" : v
  end

  def dealer_hand_value
    v = 0
    dealer_hand.each { |card| v += card.value }

    if v > 21 && player_hand_value.is_a?(String)
      v
    elsif v > 21
      "Bust!"
    else
      v
    end

  end

  def player_blackjack?
    player_hand_value == 21 ? true : false
  end

  def dealer_blackjack?
    dealer_hand_value == 21 ? true : false
  end

  def declare_winner

    return "Dealer wins" if player_hand_value.is_a?(String)

    return "Player wins" if dealer_hand_value.is_a?(String)

    return "Push" if dealer_hand_value ==player_hand_value

    dealer_hand_value > player_hand_value ? "Dealer wins" : "Player wins"
  end

  def use_action
    @game.action_counter -= 1
    @game.save
  end

  def dealer_action

    until dealer_hand_value == "Bust!"
      break if dealer_hand_value > 17
      deck = @game.decks.first.cards.where(player_hand: false, dealer_hand: false)
      card = deck.to_a.shuffle.pop
      card.dealer_hand = true
      card.save
    end
  end

  def game_over?
    if @game.action_counter <= 0 || @game.score <= 0
      true
    else
      false
    end
  end

  def settle_bets

    if @winner == "Player wins"
      @game.score += session[:bet].to_i
      @game.save
    elsif @winner == "Dealer wins"
      @game.score -= session[:bet].to_i
      @game.save
    end
    session.delete :bet
  end

end