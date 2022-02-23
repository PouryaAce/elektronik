CREATE DATABASE elektronik;
\c

CREATE TABLE music(id SERIAL PRIMARY KEY,user_id INTEGER,name TEXT,genre TEXT, artist TEXT,track TEXT);

CREATE TABLE users(id SERIAL PRIMARY KEY,name TEXT,email TEXT,username TEXT, password_digest TEXT);


SELECT users.username, music.name,genre,artist,track FROM music INNER JOIN users ON user_id =users.id;