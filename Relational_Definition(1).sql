CREATE DATABASE IF NOT EXISTS VMS;
USE VMS;


DROP TABLE runs_for;
DROP TABLE manages;
DROP TABLE administrator;
DROP TABLE votes_for;
DROP TABLE election;
DROP TABLE candidate;
DROP TABLE voter;



CREATE TABLE IF NOT EXISTS voter 
(
    user_id	INT,
    name	VARCHAR(255) NOT NULL DEFAULT ' ',
    address	VARCHAR(255) NOT NULL DEFAULT ' ',
    email	VARCHAR(255) NOT NULL DEFAULT ' ',
    password	VARCHAR(255) NOT NULL DEFAULT ' ',
    aadhar_no 	INT UNIQUE NOT NULL DEFAULT '0',
    PRIMARY KEY(user_id)
);
describe voter;



CREATE TABLE IF NOT EXISTS candidate
(
    user_id	INT,
    candidate_id INT,
    party_name	VARCHAR(255) NOT NULL DEFAULT ' ',
    manifesto 	VARCHAR(255) NOT NULL DEFAULT ' ',
    PRIMARY KEY(candidate_id),
    CONSTRAINT FK_CV FOREIGN KEY (user_id) REFERENCES voter(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);
describe candidate;



CREATE TABLE IF NOT EXISTS election 
(
    election_id	INT AUTO_INCREMENT,
    Election_State	VARCHAR(255) NOT NULL DEFAULT ' ',
    Start_Date	VARCHAR(255) NOT NULL DEFAULT ' ',
    End_Date 	VARCHAR(255) NOT NULL DEFAULT ' ',
    PRIMARY KEY(election_id),
    UNIQUE(Election_State, Start_Date),
    UNIQUE(Election_State, End_Date)
);
ALTER TABLE election AUTO_INCREMENT=10000001;
describe election;



CREATE TABLE IF NOT EXISTS votes_for 
(
    vote_id	INT AUTO_INCREMENT,
    election_id	INT,
    candidate_id	INT,
	user_id 	INT,
    PRIMARY KEY(vote_id),
    CONSTRAINT FK_VFU FOREIGN KEY (user_id) REFERENCES voter(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_VFE FOREIGN KEY (election_id) REFERENCES election(election_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_VFC FOREIGN KEY (candidate_id) REFERENCES candidate(candidate_id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE(election_id, user_id)
);
ALTER TABLE votes_for AUTO_INCREMENT=10000001;
describe votes_for;



CREATE TABLE IF NOT EXISTS administrator
(
    admin_id	INT,
    admin_password	VARCHAR(255) NOT NULL DEFAULT ' ',
    user_id 	INT,
    PRIMARY KEY(admin_id),
    CONSTRAINT FK_AV FOREIGN KEY(user_id) REFERENCES voter(user_id) ON DELETE CASCADE ON UPDATE CASCADE ,
    UNIQUE (admin_id, user_id)
);
describe administrator;



CREATE TABLE IF NOT EXISTS manages
(
	admin_id INT,
    election_id INT,
    CONSTRAINT FK_MA FOREIGN KEY(election_id) REFERENCES election(election_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_ME FOREIGN KEY(admin_id) REFERENCES administrator(admin_id) ON DELETE CASCADE ON UPDATE CASCADE
);
describe manages;



CREATE TABLE IF NOT EXISTS runs_for 
(
    election_id	INT,
    candidate_id INT,
    CONSTRAINT FK_RE FOREIGN KEY(election_id) REFERENCES election(election_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_RC FOREIGN KEY(candidate_id) REFERENCES candidate(candidate_id) ON DELETE CASCADE ON UPDATE CASCADE
);
describe runs_for;
	
