get '/:user_id/playfj' do
  redirect '/' if session_logged_in? == false

  @user = User.find(params[:user_id])
  # @game = session[:game]
  erb :playfj
end

post '/:user_id/playfj/' do
  @user = User.find(params[:user_id])
  @game = @user.games.create(score: 2000)
  session[:game] = @game
  @game.deal

  erb :playfj
end

post '/:user_id/playfj/hit' do
  p user = User.find(params[:user_id])
  p game = session[:game]
  # game.hit(game.player_hand)

  # erb :playfj
end