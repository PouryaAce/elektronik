get '/sign_up' do
    erb :'users/sign_up'
  end
  
  get '/user' do
    name = params["name"]
    email = params["email"]
    username = params["username"]
    password = params["password"]
  
    create_user(name, email, username, password)
  
    redirect '/'
  end