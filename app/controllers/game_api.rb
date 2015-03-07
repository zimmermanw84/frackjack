
# Add card using JSON object
put '/api/playfj/hit' do
  deck = Deck.first.cards.where(player_hand: false, dealer_hand: false)
  @game = Game.find(session[:game_id])
  card = deck.sample
  card.player_hand = true
  card.save
  # p updated_player_hand = player_hand_value

  content_type :json
  { id: card.id, name: card.name, value: card.value, img_url: card.img_url }.to_json

end

put '/api/playfj/gameinfo' do
  @game = Game.find(session[:game_id])
  deck_count = Deck.first.cards.where(player_hand: false, dealer_hand: false).count
  content_type :json
  # use_action


  { game_id: @game.id, score: @game.score, actions_left: @game.action_counter , updated_player_hand: player_hand_value, card_count: deck_count }.to_json
end