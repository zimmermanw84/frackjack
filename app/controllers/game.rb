get '/:user_id/playfj' do
  redirect '/' if session_logged_in? == false

  @user = User.find(params[:user_id])
  # @game = session[:game]
  erb :playfj
end

post '/:user_id/playfj' do
  @user = User.find(params[:user_id])
  @game = @user.games.create(score: 2000)
  @game.deal

  @game.hit!(@game.player_hand) if @game.delt?

  erb :playfj
end

# <<<<< Work Bookmark form also
post '/:user_id/playfj/hit' do
  user = User.find(params[:user_id])
  @game = params[:game]
  @game.hit!(@game.player_hand)

  erb :playfj
end