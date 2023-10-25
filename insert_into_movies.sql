-- Active: 1698132942408@@127.0.0.1@5432@test
-- In order to add data we need to make some changes in the table schema first
ALTER TABLE movie
ALTER COLUMN synopsis SET DATA TYPE text;

ALTER TABLE movie
ALTER COLUMN title TYPE VARCHAR(50);

INSERT INTO MOVIE (id, title, synopsis) VALUES
(1, 'The Dark Knight', 'When the Joker wreaks havoc on Gotham City, Batman must confront one of his greatest adversaries.'),
(2, 'Inception', 'A thief who enters people''s dreams and steals their secrets must now plant an idea into a CEO''s mind.'),
(3, 'Avatar', 'A paraplegic marine is chosen to participate in an expedition on the alien world of Pandora, where he becomes torn between following orders and protecting the world he feels is his home.'),
(4, 'The Matrix', 'A computer hacker discovers a dystopian world ruled by machines and joins a group of rebels in their fight against the overlords.'),
(5, 'Jurassic Park', 'A billionaire creates a wildlife park with cloned dinosaurs, but things go awry when the dinosaurs escape and threaten the lives of the visitors.'),
(6, 'The Lord of the Rings: The Fellowship of the Ring', 'A young hobbit named Frodo Baggins embarks on a perilous journey to destroy a powerful ring and save Middle-earth.'),
(7, 'The Avengers', 'Superheroes, including Iron Man, Thor, and Captain America, join forces to save the world from a formidable enemy.'),
(8, 'Gladiator', 'A Roman general seeks revenge after being betrayed by a corrupt emperor and forced into slavery.'),
(9, 'Forrest Gump', 'The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate, and other historical events unfold through the perspective of an Alabama man with an IQ of 75.'),
(10, 'The Shawshank Redemption', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.');


-- Insert Directors and Actors
INSERT INTO person (id, name, surname, date_birthday)
VALUES
    (1, 'Christopher', 'Nolan', '1970-07-30'), -- Director of The Dark Knight
    (2, 'James', 'Cameron', '1954-08-16'), -- Director of Avatar
    (3, 'Peter', 'Jackson', '1961-10-31'), -- Director of The Lord of the Rings: The Fellowship of the Ring
    (4, 'Ridley', 'Scott', '1937-11-30'), -- Director of Gladiator
    (5, 'Frank', 'Darabont', '1959-01-28'), -- Director of The Shawshank Redemption
    (6, 'Christian', 'Bale', '1974-01-30'), -- Actor in The Dark Knight
    (7, 'Heath', 'Ledger', '1979-04-04'), -- Actor in The Dark Knight
    (8, 'Sam', 'Worthington', '1976-08-02'), -- Actor in Avatar
    (9, 'Elijah', 'Wood', '1981-01-28'), -- Actor in The Lord of the Rings: The Fellowship of the Ring
    (10, 'Russell', 'Crowe', '1964-04-07'), -- Actor in Gladiator
    (11, 'Keanu', 'Reeves', '1964-09-02'), -- Actor in The Matrix
    (12, 'Sam', 'Neill', '1947-09-14'), -- Actor in Jurassic Park
    (13, 'Ian', 'McKellen', '1939-05-25'), -- Actor in The Lord of the Rings: The Fellowship of the Ring
    (14, 'Robert', 'Downey Jr.', '1965-04-04'), -- Actor in The Avengers
    (15, 'Tom', 'Hanks', '1956-07-09'), -- Actor in Forrest Gump
    (16, 'Jon', 'Landau', '1960-07-23'), -- Producer of Avatar
    (17, 'Joe', 'Letteri', '1956-12-01'), -- Visual Effects Artist for Avatar
    (18, 'Grant', 'Major', '1963-04-15'), -- Visual Effects Supervisor for The Matrix
    (19, 'Stan', 'Winston', '1946-04-07'); -- Special Effects Artist for Jurassic Park


-- Year is an integer but in the table schema it's date TYPE
-- We can't do as always:
-- ALTER TABLE award ALTER COLUMN year TYPE INT;
-- With this query we get the error: "column "year" cannot be cast automatically to type integer"

-- Step 1: delete the year COLUMN
ALTER TABLE award
DROP COLUMN year;
-- Step 2: create the new column
ALTER TABLE award
ADD COLUMN year INT;

-- Insert Award Data
INSERT INTO award (id, name, year, id_movie, id_person)
VALUES
    (1, 'Best Picture', 2008, 1, 7), -- The Dark Knight
    (2, 'Best Visual Effects', 2010, 3, 16), -- Avatar
    (3, 'Best Director', 1999, 6, 3), -- The Lord of the Rings: The Fellowship of the Ring
    (4, 'Best Actor', 2001, 8, 4), -- Gladiator
    (5, 'Best Picture', 1994, 10, 5), -- The Shawshank Redemption
    (6, 'Best Original Screenplay', 2008, 1, 7), -- The Dark Knight
    (7, 'Best Cinematography', 2010, 3, 16), -- Avatar
    (8, 'Best Adapted Screenplay', 1999, 6, 3), -- The Lord of the Rings: The Fellowship of the Ring
    (9, 'Best Supporting Actor', 2001, 7, 4), -- Gladiator
    (10, 'Best Director', 2008, 1, 7), -- The Dark Knight
    (11, 'Best Supporting Actor', 1994, 5, 5); -- The Shawshank Redemption



-- Insert Performed By Data
INSERT INTO performed_by (id_movie, id_person)
VALUES
    (1, 6), -- Movie: The Dark Knight, Actor: Christian Bale
    (1, 7), -- Movie: The Dark Knight, Actor: Heath Ledger
    (3, 8), -- Movie: Avatar, Actor: Sam Worthington
    (6, 9), -- Movie: The Lord of the Rings: The Fellowship of the Ring, Actor: Elijah Wood
    (8, 4), -- Movie: Gladiator, Actor: Russell Crowe
    (9, 5), -- Movie: Forrest Gump, Actor: Tom Hanks
    (4, 11), -- Movie: The Matrix, Actor: Keanu Reeves
    (5, 12), -- Movie: Jurassic Park, Actor: Sam Neill
    (7, 14), -- Movie: The Avengers, Actor: Robert Downey Jr.
    (6, 13); -- Additional actors for The Lord of the Rings: The Fellowship of the Ring


-- Insert Directed By Data
INSERT INTO directed_by (id_movie, id_person)
VALUES
    (1, 1), -- Movie: The Dark Knight, Director: Christopher Nolan
    (3, 2), -- Movie: Avatar, Director: James Cameron
    (6, 3), -- Movie: The Lord of the Rings: The Fellowship of the Ring, Director: Peter Jackson
    (8, 4); -- Movie: Gladiator, Director: Ridley Scott

