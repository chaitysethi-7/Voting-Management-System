/* SAMPLE QUERIES THAT CAN BE RUN. TO CHECK THE CONSTRAINTS OF UNIQUENESS AND FOREIGN KEYS YOU CAN ADD QUERIES AS PER YOUR REQUIREMENTS*/
USE vms;

SELECT * FROM voter;
call insert_user('12345678', 'Vijayu', '1237462 Bandra Road', 'jayu.orci@hotmail.ca', 'AAHJKSDTY90Y', '388671625');
SELECT * FROM voter;


SELECT * FROM candidate;
call insert_candidate(10000002, 31809980, 75431171 , 'koko', 'ghar', 'sjdfgsjhyudfg', 'AJSHFGSF', 1298946788, 'CONGRESS', 'MO');
SELECT * FROM candidate;


SELECT * FROM votes_for;
call register_vote('Punjab', '29-01-2013', 59559032, 97651571);
SELECT * FROM votes_for;
 
 
SELECT * FROM election;
call insert_election2('61906143','782368540','17-03-2023','24-04-2023','Telangana' ,'isujsgsrdivjb');
SELECT * FROM election;


call get_candidate_vote_count('89436412', '10000002');


call get_candidate_vote_percentage('89436412','10000002');


call get_election_winner(10000002);


call get_rank('10000002');



call get_election_vote_count('10000002');



call update_user_info('39426712','Aana Strikcens', 'Loharu, Pilani', 'f2020@pilani.com', 'dijnngwisjg', '34565342');
SELECT * FROM voter;


call delete_user_info(97651571);
SELECT * FROM voter;







