     
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'pg'
require 'bcrypt'

require_relative 'db/db'

get '/' do
  musics = run_sql("SELECT * FROM music")
  erb :index, locals: {
    musics: musics
  }
end

get '/music' do
  erb :music 
end

post '/music' do
  name = params["name"]
  genre = params["genre"]
  artist = params["artist"]
  cover_url = params["cover_url"]
  track_url = params["track_url"]

  run_sql("INSERT INTO music(name, genre, artist, cover) VALUES ($1, $2, $3, $4)", [name, genre, artist, cover])

  redirect '/'
end


