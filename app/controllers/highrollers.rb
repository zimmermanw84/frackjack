before '/:user_id/highrollers' do
  redirect '/' if session_logged_in? == false
end


get '/:user_id/highrollers' do
  @user = User.find(params[:user_id])
  @games = Game.all.limit(10).order(score: 'desc')

  erb :highrollers
end

