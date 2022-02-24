

get '/login' do
    erb :'sessions/login', locals: {
      error_message: ""
    }
    
end
  
post '/sessions' do
  username = params["username"]
  password = params["password"]

  user = find_user_by_username(username)

  if user && BCrypt::Password.new(user['password_digest']) == params['password']
    
    session['user_id'] = user['id']

    redirect'/'
  else
    erb :'sessions/login', locals: {
      error_message: "Invalid username or password"
    } 

  end
end

delete '/sessions' do
  session['user_id'] = nil

  redirect '/'
end