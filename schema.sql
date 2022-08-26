/* CREATING THE ANIMALS TABLE */

CREATE TABLE animals (
   id SERIAL PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   date_of_birth DATE NOT NULL,
    escape_attempts INT,
    neutered BOOLEAN,
    weigth_kg DECIMAL,
    species VARCHAR(50)
);

CREATE TABLE owners (
   id SERIAL PRIMARY KEY,
   full_name VARCHAR(50) NOT NULL,
   age INT NOT NULL
   
);

CREATE TABLE species (
   id SERIAL PRIMARY KEY,
   name VARCHAR(50) NOT NULL
  
);

CREATE SEQUENCE my_serials AS integer START 1 OWNED BY animals.id;
ALTER TABLE animals ALTER COLUMN id SET DEFAULT setval('my_serials');

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_constraint FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals ADD COLUMN owner_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id) REFERENCES owners (id);

