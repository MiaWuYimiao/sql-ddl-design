-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Team" (
    "Team_id" int   NOT NULL,
    "Name" string   NOT NULL,
    "City" string   NOT NULL,
    CONSTRAINT "pk_Team" PRIMARY KEY (
        "Team_id"
     )
);

CREATE TABLE "Player" (
    "Player_id" int   NOT NULL,
    "Name" String   NOT NULL,
    "Team_id" int   NOT NULL,
    CONSTRAINT "pk_Player" PRIMARY KEY (
        "Player_id"
     )
);

CREATE TABLE "Referee" (
    "Referee_id" int   NOT NULL,
    "Name" string   NOT NULL,
    CONSTRAINT "pk_Referee" PRIMARY KEY (
        "Referee_id"
     )
);

CREATE TABLE "Game" (
    "Match_id" int   NOT NULL,
    "Team1" int   NOT NULL,
    "Team2" int   NOT NULL,
    "Referee" int   NOT NULL,
    "Date" date   NOT NULL,
    "Season" int   NOT NULL,
    CONSTRAINT "pk_Game" PRIMARY KEY (
        "Match_id"
     )
);

CREATE TABLE "Goal" (
    "ID" int   NOT NULL,
    "Match_id" int   NOT NULL,
    "ScoredBy" int   NOT NULL,
    CONSTRAINT "pk_Goal" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Season" (
    "Season_id" int   NOT NULL,
    "Season_name" string   NOT NULL,
    "Start_date" date   NOT NULL,
    "End_date" date   NOT NULL,
    CONSTRAINT "pk_Season" PRIMARY KEY (
        "Season_id"
     )
);

ALTER TABLE "Player" ADD CONSTRAINT "fk_Player_Team_id" FOREIGN KEY("Team_id")
REFERENCES "Team" ("Team_id");

ALTER TABLE "Game" ADD CONSTRAINT "fk_Game_Team1" FOREIGN KEY("Team1")
REFERENCES "Team" ("Team_id");

ALTER TABLE "Game" ADD CONSTRAINT "fk_Game_Team2" FOREIGN KEY("Team2")
REFERENCES "Team" ("Team_id");

ALTER TABLE "Game" ADD CONSTRAINT "fk_Game_Referee" FOREIGN KEY("Referee")
REFERENCES "Referee" ("Referee_id");

ALTER TABLE "Game" ADD CONSTRAINT "fk_Game_Season" FOREIGN KEY("Season")
REFERENCES "Season" ("Season_id");

ALTER TABLE "Goal" ADD CONSTRAINT "fk_Goal_Match_id" FOREIGN KEY("Match_id")
REFERENCES "Game" ("Match_id");

ALTER TABLE "Goal" ADD CONSTRAINT "fk_Goal_ScoredBy" FOREIGN KEY("ScoredBy")
REFERENCES "Player" ("Player_id");

