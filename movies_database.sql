CREATE TABLE movie (
    id INT PRIMARY KEY,
    title VARCHAR(30),
    synopsis VARCHAR(150)
);

CREATE TABLE person (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    surname VARCHAR(20),
    date_birthday date
);

CREATE TABLE award (
    id INT,
    name varchar(30),
    year date,
    id_movie INT references movie(id),
    id_person INT references person(id),
    PRIMARY KEY (id)
);

CREATE TABLE directed_by (
    id_movie INT references movie(id),
    id_person INT references person(id),
    PRIMARY KEY (id_movie, id_person)
);


CREATE TABLE performed_by (
    id_movie INT references movie(id),
    id_person INT references person(id),
    PRIMARY KEY (id_movie, id_person)
);
