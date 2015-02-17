
get '/:user_id/playfj' do
  redirect '/' if session_logged_in? == false

  @user = User.find(params[:user_id])
  erb :playfj
end
