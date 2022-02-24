get '/sign_up' do
    erb :'users/sign_up'
end
  
post '/user' do
  name = params["name"]
  email = params["email"]
  username = params["username"]
  password = params["password"]

  create_user(name, email, username, password)

  redirect '/login'
end