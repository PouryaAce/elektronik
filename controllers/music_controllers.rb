get '/' do
  user_id = session['user_id']
    users_music = get_users_music(user_id)
    erb :'/music/index', locals: {
      users_music: users_music
    }
end

get '/about' do
  erb :'music/about'
end
  
get '/music' do
  erb :'/music/music' 
end

post '/music' do
  name = params["name"]
  genre = params["genre"]
  artist = params["artist"]
  track = params["track"]
  user_id = session['user_id']
  

  
  create_music(user_id, name, genre, artist, track)

  redirect '/'
end

get '/music/:id/edit' do
  id = params["id"]
  music = get_music(id)
  erb :'music/edit', locals: {
  music: music,
  id: id
  }
end
  
  
put '/music/:id' do
  id = params['id']
  name = params["name"]
  genre = params["genre"]
  artist = params["artist"]
  track = params["track"]

  update_music(id, name, genre, artist, track)

  redirect '/'

end
  
delete '/music/:id' do
  id = params['id']
  delete_music(id)
  redirect '/'
end

get '/tracks' do
  name = params["name"]
  genre = params["genre"]
  artist = params["artist"]
  track = params["track"]
  
  users_music = all_music()
  

  erb :'/music/tracks', locals: {
    users_music: users_music
  }
end  