
# Add card using JSON object
put '/api/playfj/hit' do
  deck = Deck.first.cards.where(player_hand: false, dealer_hand: false)
  card = deck.sample
  card.player_hand = true
  card.save
  content_type :json
  { id: card.id, name: card.name, value: card.value, img_url: card.img_url }.to_json
end

put '/api/playfj/gameinfo' do
  game = Game.find(session[:game_id])
  content_type :json
  { game_id: game.id, score: game.score, actions: game.action_counter }.to_json
end