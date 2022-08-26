/* INSERTING DATA INTO the animals table */

-- Insert the following data into the owners table: 

INSERT INTO owners  (full_name, age) VALUES ( 'Sam Smith', 34), ( 'Jennifer Orwell', 19),
( 'Bob', 45), ( 'Melody Pond', 77), ( 'Dean Winchester', 14), ( 'Jodie Whittaker', 38);

-- Insert the following data into the species table:
INSERT INTO species (name) VALUES ( 'Pokemon'), ( 'Digimon');

-- If the name ends in "mon" it will be Digimon
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

-- All other animals are Pokemon

UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

-- Modify your inserted animals to include owner information (owner_id): 
-- Sam Smith owns Agumon.

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';

-- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon','Pikachu');

-- Bob owns Devimon and Plantmon.
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon','Plantmon');

-- Melody Pond owns Charmander, Squirtle, and Blossom.

UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander','Squirtle', 'Blossom');

-- Dean Winchester owns Angemon and Boarmon.

UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');
