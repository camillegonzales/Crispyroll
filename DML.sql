-- Project Title: Crispyroll
-- Group Name: Query Queens
-- Group 50: Camille Gonzales, Jennifer Trainor
-- CS340: Project Step 3 Draft

-- DATA MANIPULATION QUERIES: SELECT, INSERT, UPDATE and DELETE queries

-- NOTE: colon : character being used to denote the variables that will have data from the backend


/* ------------------- Studios queries ------------------- */
-- Select all Studios
SELECT * FROM Studios;

-- Add new Studio
INSERT INTO Studios (studio_name, year_founded) 
VALUES (:studio_name_Input, :year_founded_Input);

-- Update Studio
UPDATE Studios 
SET studio_name = :studio_name_Input, year_founded = :year_founded_Input
WHERE studio_id = :studio_id_to_update;

-- Delete Studio
DELETE FROM Studios 
WHERE studio_id = :studio_id_to_delete;

-- Select Studios for dropdown
SELECT studio_id, studio_name FROM Studios;


/* ------------------- Animes queries ------------------- */
-- Select all Animes
SELECT * FROM Animes;

-- Add new Anime
INSERT INTO Animes (title, studio_id, num_episode)
VALUES (:title_Input, :studio_id_from_dropdown, :num_episode_Input);

-- Update Anime
UPDATE Animes
SET title = :title_Input, studio_id = :studio_id_from_dropdown, :num_episode_Input
WHERE anime_id = :anime_id_to_update;

-- Delete Studio
DELETE FROM Animes
WHERE anime_id = :anime_id_to_delete;

-- Select Animes for dropdown
SELECT anime_id, title FROM Animes;


/* ------------------- Users queries ------------------- */
-- Select all Users
SELECT * FROM Animes;

-- Add new User
INSERT INTO Users (user_name, user_email)
VALUES (user_name = :user_name_Input, user_email = :user_email_Input);

-- Update User
UPDATE Users
SET user_name = :user_name_Input, user_email = :user_email_Input
WHERE user_id = :user_id_to_update;

-- Delete User
DELETE FROM Users
WHERE user_id = :user_id_to_delete;

-- Select User for dropdown
SELECT user_id, user_name FROM Users;


/* ------------------- Users_Animes queries ------------------- */
/* -- Select all Users
SELECT * FROM Animes;

-- Add new User
INSERT INTO Users (user_name, user_email)
VALUES (user_name = :user_name_Input, user_email = :user_email_Input);

-- Update User
UPDATE Users
SET user_name = :user_name_Input, user_email = :user_email_Input
WHERE user_id = :user_id_to_update;

-- Delete User
DELETE FROM Users
WHERE user_id = :user_id_to_delete;

-- Select User for dropdown
SELECT user_id, user_name FROM Users; */


/* ------------------- Ratings queries ------------------- */
-- Select all Ratings
SELECT * FROM Ratings;

-- Add new Rating
INSERT INTO Ratings (user_id, anime_id, rating, review)
VALUES (user_id = user_id_Input, anime_id = :anime_id_from_dropdown, rating = :rating_Input, review = :review_Input);

-- Update Rating
UPDATE Ratings
SET user_id = user_id_Input, anime_id = :anime_id_from_dropdown, rating = :rating_Input, review = :review_Input
WHERE rating_id = :rating_id_to_update;

-- Delete User
DELETE FROM Ratings
WHERE rating_id = :rating_id_to_delete;


