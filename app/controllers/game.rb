before '/:user_id/playfj' do
  redirect '/' if session_logged_in? == false
end


get '/:user_id/playfj' do
  @user = User.find(params[:user_id])

  if session[:game_id]
    @game = @user.games.find(session[:game_id])
    reset_cards
  else
    @game = @user.games.create
    set_session_game_tracker(@game)
  end


  erb :playfj
end

get '/:user_id/playfj/reset' do
  @user = User.find(params[:user_id])
  @game = @user.games.find(session[:game_id])
  reset_cards
  clear_session_game

  erb :playfj
end


post '/:user_id/playfj' do
  @user = User.find(params[:user_id])

  if session[:game_id]
    @game = @user.games.find(session[:game_id])
    reset_cards
  else
    @game = @user.games.create
    set_session_game_tracker(@game)
  end

  erb :playfj
end

post '/:user_id/playfj/make_wager' do
  @user = User.find(params[:user_id])
  @game = @user.games.find(session[:game_id])
  load_decks
  select_player_dealer_hand
  session[:bet] = params[:bet]
  @wager_made = true
  erb :playfj
end

post '/:user_id/playfj/next' do
  @user = User.find(params[:user_id])
  @game = @user.games.find(session[:game_id])
  use_action
  reset_cards

  erb :playfj
end

post '/:user_id/playfj/hit' do
  @user = User.find(session[:user_id])
  @game = @user.games.find(session[:game_id])
  @wager_made = true
  hit_player_hand


  erb :playfj
end

post '/:user_id/playfj/stay' do
  @user = User.find(params[:user_id])
  @game = @user.games.find(session[:game_id])
  @wager_made = true
  @hand_over = true
  dealer_action
  @winner = declare_winner
  use_action
  settle_bets

  erb :playfj
end

