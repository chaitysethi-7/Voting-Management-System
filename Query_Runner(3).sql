-- /*To check the tables - Comment out other stuff*/
-- SET FOREIGN_KEY_CHECKS=1;
-- SELECT * FROM voter;
-- SELECT * FROM voter;
-- SELECT * FROM candidate;
-- SELECT * FROM election;
-- SELECT * FROM votes_for;
-- SELECT * FROM manages;
-- SELECT * FROM runs_for;



/*2. INSERT A NEW USER INTO USERS(VOTER) TABLE */
DROP PROCEDURE IF EXISTS insert_user;
DELIMITER $$
CREATE procedure insert_user(user_entered INT, user_name varchar(255), address varchar(255), email varchar(255), password varchar(255), aadhar_no INT)
MODIFIES SQL DATA
BEGIN
	IF (user_entered IN (SELECT user_id from voter)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT="USER EXISTS!";
    ELSE
		INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES (user_entered, user_name, address, email, password, aadhar_no);
	END IF;
END$$
DELIMITER ;



/* 3. INSERT A NEW CANDIDATE INTO CANDIDATE TABLE AFTER INSERTING INTO USER(VOTER) TABLE DUE TO SPECIALIZATION*/
DROP PROCEDURE IF EXISTS insert_candidate;
DELIMITER $$
CREATE procedure insert_candidate(election_entered INT, candidate_entered INT, user_entered INT, user_name varchar(255), address varchar(255), email varchar(255), password varchar(255), aadhar_no INT, party VARCHAR(255), manifesto VARCHAR(255))
MODIFIES SQL DATA
BEGIN
	IF (user_entered IN (SELECT user_id from voter)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT="USER EXISTS!";
    ELSE
		INSERT INTO voter (user_id, name, address, email, password, aadhar_no)
        VALUES(user_entered, user_name, address, email, password, aadhar_no);
	END IF;
    
    IF (candidate_entered IN (SELECT candidate_id from candidate)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT= "CANDIDATE EXISTS!";
	ELSE
		INSERT INTO candidate (user_id, candidate_id, party_name, manifesto )
        VALUES (user_entered, candidate_entered, party, manifesto);
	END IF;		
    
    IF (election_entered IN (SELECT election_id from election)) THEN
		INSERT INTO runs_for (candidate_id, election_id)
        VALUES (candidate_entered, election_entered);
    ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT="ELECTION DOES NOT EXISTS!";
	END IF;
END$$
DELIMITER ;



/* 4.	REGISTER A VOTE */
DROP PROCEDURE IF EXISTS register_vote;
DELIMITER $$
CREATE PROCEDURE register_vote(elec_state varchar(255), elec_date varchar(255), cand_id int, user_id int)
MODIFIES SQL DATA
BEGIN
	DECLARE elec_id int;
	IF (user_id IN (SELECT user_id from voter)) THEN
		SELECT election_id from election where elec_state = Election_State and elec_date = Start_Date into elec_id;
		INSERT INTO votes_for(election_id, candidate_id, user_id) values (elec_id, cand_id, user_id);
	ELSE 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT="USER DOES NOT EXIST!";
	END IF;
END$$
DELIMITER ;



/* 5. INSERT AN ELECTION INTO THE ELECTION TABLE UNDER THE ASSUMPTION THAT A CANDIDATE CAN'T BE AN ADMIN AND AN ADMIN HAS TO BE A PREDEFINED USER*/
DROP PROCEDURE IF EXISTS insert_election2;
DELIMITER $$
CREATE PROCEDURE insert_election2(
    user_entered INT,
    admin_entered INT,
    start_date VARCHAR(255),
    end_date VARCHAR(255),
    election_state VARCHAR(255),
    password_E VARCHAR(255)
)
BEGIN
    DECLARE admin_exists INT DEFAULT 0;
    DECLARE candidate_exists INT DEFAULT 0;
    DECLARE user_exists INT DEFAULT 0;
    DECLARE new_election_id INT DEFAULT 0;
    DECLARE candidate_entered INT DEFAULT 0;
   
    -- Check if user with the given id already exists
    SELECT COUNT(*) FROM voter WHERE user_entered = user_id INTO user_exists;
    IF user_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User does not exist.';
    END IF;
   
    -- Check if admin exists and is not a candidate in any election
    SELECT candidate_id FROM candidate WHERE user_entered = user_id INTO candidate_entered;
    SELECT COUNT(*) FROM candidate WHERE candidate_entered = candidate_id INTO candidate_exists;
   
    IF candidate_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User is already a Candidate.';
    END IF;
   
    -- Check if the admin is already managing another election
    SELECT COUNT(*) INTO admin_exists FROM manages WHERE admin_entered = admin_id;
    IF admin_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Admin_id already corresponds to an Administrator managing another election.';
    END IF;
   
    -- Insert new election
    INSERT INTO election (start_date, end_date, election_state) VALUES (start_date, end_date, election_state);
   
    -- Get the election_id for the new election
    SET new_election_id = LAST_INSERT_ID();
   
    -- Insert the user as an admin for the new election
    INSERT INTO administrator (admin_id, admin_password, user_id) VALUES (admin_entered, password_E , user_entered);
   
    -- Insert the admin as a manager for the new election
    INSERT INTO manages (election_id, admin_id) VALUES (new_election_id, admin_entered);
   
END $$;
DELIMITER ; 




/*6. GETS VOTE COUNT IN PARTICULAR ELECTION FOR GIVEN CANDIDATE*/
DROP PROCEDURE IF EXISTS get_candidate_vote_count;
DELIMITER $$
CREATE PROCEDURE get_candidate_vote_count(candidate_entered INT, election_entered INT)
BEGIN
SELECT COUNT(*) FROM votes_for 
WHERE (candidate_entered = candidate_id AND election_entered = election_id);
END $$
DELIMITER ;




/*7. GETS PERCENTAGE OF VOTES FOR GIVEN CANDIDATE IN GIVEN ELECTION */
DROP PROCEDURE IF EXISTS get_candidate_vote_percentage;
DELIMITER $$
CREATE PROCEDURE get_candidate_vote_percentage(candidate_entered INT, election_entered INT)
BEGIN
SELECT CONCAT(((SELECT COUNT(*) FROM votes_for WHERE candidate_entered = candidate_id AND election_entered=election_id)/(SELECT COUNT(*) FROM votes_for WHERE election_entered = election_id))*100,'%') AS vote_percent
FROM votes_for WHERE candidate_entered = candidate_id AND election_entered = election_id;
END $$
DELIMITER ;


	
/*8. GIVES WINNER OF AN ELECTION*/
DROP PROCEDURE IF EXISTS get_election_winner;
DELIMITER $$
CREATE PROCEDURE get_election_winner(election_entered INT)
BEGIN
	SELECT candidate.candidate_id, COUNT(*) AS vote_count
	FROM candidate 
	INNER JOIN votes_for
	ON candidate.candidate_id = votes_for.candidate_id
    WHERE votes_for.election_id = election_entered
	GROUP BY candidate_id
    ORDER BY vote_count desc
    limit 1;
END $$	
DELIMITER ;



/* 9. RANK OF CANDIDATES IN AN ELECTION*/
DROP PROCEDURE IF EXISTS get_rank;
DELIMITER $$
CREATE PROCEDURE get_rank(election_entered INT)
MODIFIES SQL DATA
BEGIN
	SELECT candidate.candidate_id, COUNT(*) AS vote_count,
    @rank := @rank + 1 AS ranking
	FROM candidate 
	INNER JOIN votes_for
	ON candidate.candidate_id = votes_for.candidate_id
    CROSS JOIN (SELECT @rank :=0) AS rank_init
    WHERE votes_for.election_id = election_entered 
	GROUP BY candidate_id
    ORDER BY vote_count desc;
END $$	
DELIMITER ;



/*10. GETS TOTAL VOTES FOR GIVEN ELECTION ID */
DROP PROCEDURE IF EXISTS get_election_vote_count;
DELIMITER $$
CREATE PROCEDURE get_election_vote_count(election_entered INT)
BEGIN
SELECT COUNT(*) FROM votes_for WHERE election_entered = election_id;
END $$
DELIMITER ;



/*11. UPDATE USER INFO*/
DROP PROCEDURE IF EXISTS update_user_info;
DELIMITER $$
CREATE PROCEDURE update_user_info(user_entered INT, name VARCHAR(512), address VARCHAR(512), email VARCHAR(512), password  VARCHAR(512), aadhar_no INT)
BEGIN
UPDATE voter SET name = name, address = address, email = email, password = password, aadhar_no = aadhar_no WHERE user_entered = user_id;
END $$
DELIMITER ;



/*12. DELETE USER*/
DROP PROCEDURE IF EXISTS delete_user_info;
DELIMITER $$
CREATE PROCEDURE delete_user_info(user_entered INT)
BEGIN
DECLARE user_exists INT DEFAULT 0;
     
         -- Check if user with the given id already exists
     SELECT COUNT(*) INTO user_exists FROM voter WHERE user_entered = user_id;
     
     IF user_exists = 0 THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User does not exist.';
     END IF;
DELETE FROM voter WHERE user_entered = user_id;
END $$;
DELIMITER ;