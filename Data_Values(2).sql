SET FOREIGN_KEY_CHECKS=1; 
-- DROP TABLE manages;

/* DELETE from voter where user_id>10; -- TO DELETE FROM VOTER IN CASE OF REPEATED CHECKS
DELETE from candidate where candidate_id>10;
DELETE from votes_for where vote_id>10;
DELETE from election where election_id>10;
DELETE from administrator where admin_id>10;
DELETE from runs_for where election_id>10;


/*INSERTING VOTER DATA/**/
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('10392149', 'Halla Acosta', '469-2173 Porttitor Road', 'felis.orci@hotmail.ca', 'YQX41TQO6YA', '141608543 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('10816078', 'Tyler Dotson', 'P.O. Box 112, 1521 Malesuada Road', 'in.faucibus@outlook.edu', 'DOL14KVU5PS', '427080444 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('13946744', 'Sopoline Pope', 'Ap #170-1975 Dolor, Street', 'maecenas.mi@google.edu', 'VOO29WWM1MH', '871452405 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('14809620', 'Savannah Montgomery', 'P.O. Box 622, 1349 Molestie Av.', 'lobortis.class@protonmail.ca', 'WBF46DCE8DP', '225903750 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('19993116', 'Lana Strickland', '2122 Leo Ave', 'blandit@hotmail.com', 'VEP83VID3LG', '110976137 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('24026930', 'Josiah Chang', 'Ap #391-2625 Nunc Ave', 'leo@icloud.net', 'XUF68WVT4OM', '898638575 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('24555631', 'Sophia Parks', 'P.O. Box 642, 4759 Eu Ave', 'quis.arcu@icloud.org', 'KHX40CZQ2XO', '134082328 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('30403329', 'Alana Mann', '841-5195 In Street', 'mauris.integer.sem@outlook.ca', 'QKW67XXK6BO', '914997836 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('32920330', 'Jin Cain', 'Ap #805-569 Felis. Rd.', 'eu.eros@icloud.net', 'DQQ30QHO1PD', '329802400');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('34120653', 'Knox Durham', 'Ap #717-1928 Tincidunt Rd.', 'tellus@google.com', 'DYV68RDK3UN', '546001195 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('39426712', 'Ezekiel Valenzuela', '3076 Quam. Av.', 'sociis@outlook.couk', 'FCH18MHR3UK', '805575215 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('43034867', 'Abra Dawson', '223-9188 Auctor Ave', 'nulla@protonmail.couk', 'LME45NXB8AS', '233605090 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('44262609', 'Bertha Odom', 'Ap #324-5460 Non Street', 'semper.egestas@aol.couk', 'TXF64XPQ6VD', '731191559 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('48115873', 'Ulric Ratliff', 'Ap #743-1211 Malesuada Rd.', 'sit.amet.nulla@outlook.edu', 'QGD21VYL8NO', '511965402 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('52430136', 'Kerry Tillman', 'P.O. Box 455, 1699 Dis Rd.', 'egestas@aol.net', 'BVK85CNS2AR', '652861934 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('54269843', 'Talon Trevino', 'P.O. Box 507, 8876 Turpis St.', 'nascetur.ridiculus@protonmail.edu', 'QWN24OST5TQ', '879714266 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('55065274', 'Angelica Atkinson', 'P.O. Box 852, 342 Eget, Ave', 'enim.mauris@aol.edu', 'BXF75WUY2XN', '259422193 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('55169375', 'Zenaida Powers', 'P.O. Box 861, 3796 Senectus St.', 'suspendisse.dui@icloud.com', 'QET43FRF3GG', '180225263 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('56678504', 'Naida Randall', 'Ap #393-5840 Arcu. Rd.', 'suspendisse.eleifend@aol.edu', 'PII41OPO7YG', '459534113 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('58272154', 'Brandon Sheppard', '126-4759 Eu Av.', 'in.magna.phasellus@icloud.couk', 'JVF34DGS3YK', '754613987');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('61906143', 'Shad Castro', '3522 Lobortis St.', 'nisl@icloud.edu', 'CFQ12VTS3KQ', '947989792');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('77620728', 'Mason Becker', '706-5475 Ornare Av.', 'penatibus.et@protonmail.net', 'QSC77BHX5UB', '682576118 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('80612489', 'Murphy Koch', '9970 Nisi Rd.', 'eleifend.non@outlook.net', 'OSD58IBM8IK', '40069500');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('82428444', 'Lamar Foley', 'P.O. Box 471, 611 Interdum Av.', 'sed.hendrerit@icloud.couk', 'LDN15AMS7SM', '308635468 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('83739294', 'Jared Thomas', 'Ap #499-8207 Eget, St.', 'auctor.velit@aol.net', 'EFF48NBF3RP', '553820948 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('86379979', 'Aidan Patrick', 'Ap #244-9203 Ut, Av.', 'amet@yahoo.ca', 'TGS87QDU4CZ', '441815328 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('88018769', 'Patience Hayes', '308-2431 Magna. Avenue', 'massa.quisque@yahoo.com', 'RXK27YFI5EO', '615343566 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('93614661', 'Lana Park', '4791 Accumsan Av.', 'ut.aliquam@hotmail.edu', 'LNA76QHM4ST', '198494922 ');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('95474693', 'Mia Adams', '331-1741 Lectus. Ave', 'fringilla@outlook.com', 'XTB29VSU5QM', '888029231');
INSERT INTO voter (user_id, name, address, email, password, aadhar_no) VALUES ('97651571', 'Gloria Rhodes', '914-8566 Nulla St.', 'scelerisque.lorem@icloud.couk', 'TGX65HHK8HG', '744259090 ');

/*INSERTING CANDIDATE DATA/**/

INSERT INTO candidate (user_id, candidate_id, party_name, manifesto ) VALUES ('14809620', '89436412', 'Congress', 'Investment in Renewable Energy and Public Infrastructure.');
INSERT INTO candidate (user_id, candidate_id, party_name, manifesto ) VALUES ('30403329', '59559032', 'BJP', 'Committed to bringing transparency in public administration and uplifting rural areas.');
INSERT INTO candidate (user_id, candidate_id, party_name, manifesto ) VALUES ('39426712', '46321648', 'AAP', 'Investment in Renewable Energy and Public Infrastructure.');
INSERT INTO candidate (user_id, candidate_id, party_name, manifesto ) VALUES ('80612489', '78613292', 'BJP', 'Reducing corruption and improving beauraucracy. We have different goals and agendas across elections.');

/*INSERTING ELECTION DATA/**/

INSERT INTO election (election_id, Election_State, Start_Date, End_Date ) VALUES ('10000001', 'Meghalaya', '15-02-2022', '25-02-2022 ');
INSERT INTO election (election_id, Election_State, Start_Date, End_Date ) VALUES ('10000002', 'Gujarat', '31-01-2013', '07-02-2013 ');
INSERT INTO election (election_id, Election_State, Start_Date, End_Date ) VALUES ('10000003', 'Chandigarh', '15-02-2022', '24-02-2022 ');
INSERT INTO election (election_id, Election_State, Start_Date, End_Date ) VALUES ('10000004', 'Uttar Pradesh', '29-06-2012', '06-07-2012 ');
INSERT INTO election (election_id, Election_State, Start_Date, End_Date ) VALUES ('10000005', 'Punjab', '29-01-2013', '07-02-2013 ');
INSERT INTO election (election_id, Election_State, Start_Date, End_Date ) VALUES ('10000006', 'Uttar Pradesh', '21-10-2019', '29-10-2019 ');


/*INSERTING VOTES_FOR RELATION DATA/**/

INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000001', '10000001', '59559032', '10392149 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000002', '10000003', '59559032', '10816078 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000003', '10000002', '46321648', '13946744 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000004', '10000006', '89436412', '14809620 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000005', '10000005', '89436412', '19993116 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000006', '10000004', '89436412', '24026930 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000007', '10000001', '59559032', '24555631 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000008', '10000003', '59559032', '30403329 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000009', '10000002', '46321648', '32920330 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000010', '10000006', '78613292', '34120653 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000011', '10000006', '46321648', '39426712 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000012', '10000005', '78613292', '43034867 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000013', '10000002', '59559032', '44262609 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000014', '10000001', '78613292', '48115873 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000015', '10000006', '89436412', '52430136 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000016', '10000006', '46321648', '54269843 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000017', '10000002', '46321648', '55065274 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000018', '10000005', '78613292', '55169375 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000019', '10000005', '59559032', '56678504 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000020', '10000001', '59559032', '58272154 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000021', '10000001', '78613292', '61906143 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000022', '10000003', '89436412', '77620728 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000023', '10000005', '78613292', '80612489 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000024', '10000002', '59559032', '82428444 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000025', '10000004', '89436412', '83739294 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000026', '10000005', '89436412', '86379979 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000027', '10000001', '46321648', '88018769 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000028', '10000004', '78613292', '93614661 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000029', '10000002', '89436412', '95474693 ');
INSERT INTO votes_for (vote_id, election_id, candidate_id,  user_id ) VALUES ('10000030', '10000006', '89436412', '97651571 ');

/*INSERTING ADMINISTRATOR ENTITY DATA/**/

INSERT INTO administrator (admin_id, admin_password, user_id ) VALUES
	('27068030', 'WNB86RCF6RW', '10392149 '),
	('55600118', 'MWD56ESV1GT', '24555631 '),
	('95602871', 'KGU41OAF6IJ', '61906143 '),
	('56854997', 'LIF69HHP4MY', '77620728 '),
	('88366802', 'SIN77JXC1KZ', '88018769 '),
	('59568196', 'NRR85YLC9GR', '97651571 ');

/*INSERTING MANAGES RELATION DATA*/

INSERT INTO manages (admin_id, election_id ) VALUES
	('27068030', '10000001 '),
	('55600118', '10000002 '),
	('95602871', '10000003 '),
	('56854997', '10000004 '),
	('88366802', '10000005 '),
	('59568196', '10000006 ');

/*INSERTING RUNS_FOR RELATION DATA/**/

INSERT INTO runs_for (election_id, candidate_id ) VALUES
	('10000001', '59559032 '),
	('10000001', '46321648 '),
	('10000001', '78613292 '),
	('10000002', '59559032 '),
	('10000002', '46321648 '),
	('10000002', '89436412 '),
	('10000003', '59559032 '),
	('10000003', '89436412 '),
	('10000003', '78613292 '),
	('10000004', '78613292 '),
	('10000004', '89436412 '),
	('10000004', '59559032 '),
	('10000005', '59559032 '),
	('10000005', '78613292 '),
	('10000005', '89436412 '),
	('10000006', '46321648 '),
	('10000006', '78613292 '),
	('10000006', '89436412 ');

/*ALL DATA INSERTED PROVIDED FOREIGN_KEY_CHECKS set to 0; 