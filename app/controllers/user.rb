get '/' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  erb :index
end

get '/users/new' do
  erb :signup
end

post '/users' do
  if User.exists?(:username => params[:username])
    @error = "That username is already registered"
    erb :signup
  elsif User.exists?(:email => params[:email])
    @error = "That email is already registered"
    erb :signup
  else
    user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
    if user.nil?
      @error = "Invalid credentials" #fallback unknown error message
    else
      session[:user_id] = user.id
      redirect '/'
    end
  end
end

post '/sessions' do
  user = User.where(:email => params[:email]).first
  if user.nil?
    #incorrect email
    @error = "Invalid login! Try again!"
    erb :index
  elsif user.password == params[:password]
    session[:user_id] = user.id
    redirect '/'
  else
    #incorrect password
    @error = "Invalid login! Try again!"
    erb :index
  end
end

get '/logout' do
  reset_cards
  clear_session_game
  session_logout_and_redirect
end

