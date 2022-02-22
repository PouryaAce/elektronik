     
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'bcrypt'

def run_sql(sql, sql_params = [])
  db = PG.connect(dbname: 'elektronik')
  result = db.exec_params(sql, sql_params)
  db.close
  result
end

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
  cover = params["cover"]

  run_sql("INSERT INTO music(name, genre, artist, cover) VALUES ($1, $2, $3, $4)", [name, genre, artist, cover])

  redirect '/'
end


