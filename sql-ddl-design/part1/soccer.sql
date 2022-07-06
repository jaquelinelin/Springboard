DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT NOT NULL
);

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  dob DATE NOT NULL,
  team_id INTEGER NOT NULL REFERENCES teams
);

CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE season
(
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

CREATE TABLE matches
(
  id SERIAL PRIMARY KEY,
  date DATE NOT NULL,
  team1_id INTEGER NOT NULL REFERENCES teams,
  team2_id INTEGER NOT NULL REFERENCES teams,
  location TEXT NOT NULL,
  start_time INTEGER NOT NULL,
  season_id INTEGER NOT NULL REFERENCES season,
  referee_id INTEGER NOT NULL REFERENCES referees
);

CREATE TABLE goals_scored
(
  id SERIAL PRIMARY KEY,
  matches_id INTEGER NOT NULL REFERENCES matches,
  player_id INTEGER NOT NULL REFERENCES players
);

CREATE TABLE results
(
  id SERIAL PRIMARY KEY,
  team_id INTEGER NOT NULL REFERENCES teams,
  matches_id INTEGER NOT NULL REFERENCES matches,
  result TEXT NOT NULL
);


