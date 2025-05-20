-- CS2 Broadcast and Analytics Database Schema

-- Championship table
CREATE TABLE championship (
    id UUID PRIMARY KEY,
    name TEXT NOT NULL,
    season_number INTEGER,
    organizer TEXT,
    game TEXT NOT NULL,
    created_at TIMESTAMP
);

-- Team table
CREATE TABLE team (
    id UUID PRIMARY KEY,
    name TEXT NOT NULL,
    faceit_id TEXT,
    region TEXT
);

-- Player table
CREATE TABLE player (
    id UUID PRIMARY KEY,
    nickname TEXT NOT NULL,
    faceit_id TEXT,
    country TEXT
);

-- Team-Player relationship (historical membership)
CREATE TABLE team_player (
    team_id UUID REFERENCES team(id),
    player_id UUID REFERENCES player(id),
    joined_at TIMESTAMP,
    left_at TIMESTAMP,
    PRIMARY KEY (team_id, player_id)
);

-- Match table
CREATE TABLE match (
    id UUID PRIMARY KEY,
    championship_id UUID REFERENCES championship(id),
    scheduled_at TIMESTAMP,
    finished_at TIMESTAMP,
    best_of INTEGER,
    team1_id UUID REFERENCES team(id),
    team2_id UUID REFERENCES team(id)
);

-- Individual games/maps in a match (e.g., BO3 structure)
CREATE TABLE game (
    id UUID PRIMARY KEY,
    match_id UUID REFERENCES match(id),
    map_name TEXT,
    game_number INTEGER,
    winner_team_id UUID REFERENCES team(id),
    score_team1 INTEGER,
    score_team2 INTEGER
);

-- Game-level stats per team
CREATE TABLE game_team_stats (
    game_id UUID REFERENCES game(id),
    team_id UUID REFERENCES team(id),
    rounds_won INTEGER,
    bombs_planted INTEGER,
    kills INTEGER,
    deaths INTEGER,
    PRIMARY KEY (game_id, team_id)
);

-- Game-level stats per player
CREATE TABLE game_player_stats (
    game_id UUID REFERENCES game(id),
    player_id UUID REFERENCES player(id),
    team_id UUID REFERENCES team(id),
    kills INTEGER,
    deaths INTEGER,
    assists INTEGER,
    headshots INTEGER,
    adr REAL,
    kast REAL,
    PRIMARY KEY (game_id, player_id)
);