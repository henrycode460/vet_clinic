/* CREATING THE ANIMALS TABLE */

CREATE TABLE animals (
   id int PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   date_of_birth DATE NOT NULL,
    escape_attempts INT,
    neutered BOOLEAN,
    weigth_kg DECIMAL,
    species VARCHAR(50)
);
