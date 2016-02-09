-- Master schema and table definition for all ethereum-scripts
-- This should act as both schema and migration, since there is
-- no real important data and edits/drops/changes can be done manually

-- Table definition for github repos (scripts/github.rb)
CREATE TABLE IF NOT EXISTS github (
  id SERIAL UNIQUE PRIMARY KEY,
  count INTEGER NOT NULL,
  created_at DATETIME DEFAULT current_timestamp,
  updated_at DATETIME DEFAULT current_timestamp
);

-- Table definition for meetup group (scripts/meetup.rb)
CREATE TABLE IF NOT EXISTS meetups (
  id SERIAL UNIQUE PRIMARY KEY,
  title TEXT NOT NULL,
  member INTEGER NOT NULL,
  description TEXT,
  created_at DATETIME DEFAULT current_timestamp,
  updated_at DATETIME DEFAULT current_timestamp
);

-- Table definition for poloniex (scripts/poloniex/rb)
CREATE TABLE IF NOT EXISTS poloniex (
  id SERIAL UNIQUE PRIMARY KEY,
  volume DECIMAL(15,9) NOT NULL,
  day_hi DECIMAL(15,9) NOT NULL,
  day_lo DECIMAL(15,9) NOT NULL,
  created_at DATETIME DEFAULT current_timestamp,
  updated_at DATETIME DEFAULT current_timestamp
);
