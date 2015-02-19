get '/:user_id/playfj' do
  redirect '/' if session_logged_in? == false

  @user = User.find(params[:user_id])

  erb :playfj
end

post '/:user_id/playfj' do
  @user = User.find(params[:user_id])
  @game = @user.games.create
  load_decks
  select_player_dealer_hand
  set_session_game_tracker(@game)

  erb :playfj
end

post '/:user_id/playfj/hit' do
  @user = User.find(params[:user_id])
  @game = @user.games.find(session[:game_id])
  hit_player_hand
  erb :playfj
end

post '/:user_id/playfj/stay' do
  dealer_action

  erb :playfj
end