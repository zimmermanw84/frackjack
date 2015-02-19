before '/:user_id/playfj' do
  redirect '/' if session_logged_in? == false
end

# after '/:user_id/playfj' do
#   @user = User.find(params[:user_id])
#   @game = @user.games.find(session[:game_id])
#   redirect '/:user_id/playfj/gameover' if game_over?
# end

get '/:user_id/playfj' do
  @user = User.find(params[:user_id])
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
  end

  load_decks
  select_player_dealer_hand
  set_session_game_tracker(@game)

  erb :playfj
end

# get '/:user_id/playfj/gameover' do

#   @user = User.find(session[:user_id])
#   Game.find(session[:game_id])

#   erb :gameover
# end

post '/:user_id/playfj/hit' do
  @user = User.find(session[:user_id])
  @game = @user.games.find(session[:game_id])
  hit_player_hand


  erb :playfj
end

post '/:user_id/playfj/stay' do
  @user = User.find(params[:user_id])
  @game = @user.games.find(session[:game_id])
  dealer_action
  @winner = declare_winner
  use_action

  erb :playfj
end

