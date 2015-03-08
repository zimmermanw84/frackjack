
get '/login/twitter' do
  redirect to("https://api.twitter.com/1.1/oauth_consumer_key=0ypZWCCAzlgk3lVqyzq7lhdVu")
end

get '/auth/twitter/callback' do
  env['omniauth.auth'] ? session[:admin] = true : halt(401,'Not Authorized')
  "You are now logged in"
end

get '/auth/failure' do
  params[:message]
end