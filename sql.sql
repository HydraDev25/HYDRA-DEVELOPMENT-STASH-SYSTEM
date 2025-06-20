CREATE TABLE IF NOT EXISTS hydra_stashes (
    citizenid VARCHAR(50) NOT NULL PRIMARY KEY,
    FOREIGN KEY (citizenid) REFERENCES players(citizenid) ON DELETE CASCADE
);
