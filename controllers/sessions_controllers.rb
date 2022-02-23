

get '/login' do
    erb :'sessions/login'
    
end
  
post '/sessions' do
  username = params["username"]
  password = params["password"]

  user = find_user_by_username(username)

  if user && BCrypt::Password.new(user['password_digest']) == params['password']
    
    session['user_id'] = user['id']

    redirect'/'
  end
end

delete '/sessions' do
  session['user_id'] = nil

  redirect '/'
end