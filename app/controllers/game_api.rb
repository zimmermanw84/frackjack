
# Add card using JSON object
put '/:user_id/playfj/hit_api' do
  content_type :json

  @user = User.find(session[:user_id])
  @game = @user.games.find(session[:game_id])

  deck = @game.decks.first.cards.where(player_hand: false, dealer_hand: false)
  card = deck.sample

  { id: card.id, name: card.name, value: card.value, img_url: card.img_url }.to_json

end
