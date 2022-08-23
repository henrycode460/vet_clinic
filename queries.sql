-- update the animals table by setting the species column to unspecified
BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;


-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon
BEGIN
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT

-- delete all records in the animals table,
 BEGIN;
 DELETE FROM animals;
 ROLLBACK;

-- Delete all animals born after Jan 1st, 2022.
 DELETE FROM animals WHERE date_of_birth = '2022-01-01';

-- Update all animals' weight to be their weight multiplied by -1.
BEGIN;
UPDATE animals SET weigth_kg = weigth_kg * -1;
SAVEPOINT point1;
ROLLBACK TO SAVEPOINT point1;
-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weigth_kg = weigth_kg * -1 WHERE weigth_kg < 0;
COMMIT;

-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weigth_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, COUNT(escape_attempts) FROM animals GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weigth_kg), MAX(weigth_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT escape_attempts, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN DATE '1990-01-01' AND '2000-01-01' GROUP BY escape_attempts;















