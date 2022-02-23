def all_music()
    run_sql("SELECT users.username, music.name,genre,artist,track FROM music INNER JOIN users ON user_id =users.id;")
end

def get_users_music(user_id)
    run_sql("SELECT * FROM music WHERE user_id = $1", [user_id])
end

def create_music(user_id, name, genre, artist, track)
    run_sql("INSERT INTO music(user_id, name, genre, artist, track) VALUES ($1, $2, $3, $4,$5)", [user_id,name, genre, artist, track])
end

def get_music(id)
    run_sql("SELECT * FROM music WHERE id = $1", [id])[0]
end

def update_music(id, name, genre, artist, track)
    run_sql("UPDATE music SET name = $2, genre = $3, artist = $4, track = $5 WHERE id = $1", [id, name, genre, artist, track])
end

def delete_music(id)
    run_sql("DELETE FROM music WHERE id = $1", [id])
end

def get_user_name(name)
    run_sql("SELECT * FROM users WHERE name = $1", [name])[0]
end