-- What animals belong to Melody Pond?
SELECT animals.name, owners.full_name FROM animals 
JOIN owners ON animals.owner_id = owners.id WHERE animals.owner_id = 4;

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name, species.name FROM animals 
JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT animals.name, owners.full_name AS Owner 
FROM animals 
LEFT JOIN owners ON animals.owner_id = owners.id;  

-- How many animals are there per species?
SELECT species.name, COUNT(animals.species_id) FROM animals
JOIN species ON animals.species_id = species.id 
GROUP BY species.name; 

-- List all Digimon owned by Jennifer Orwell.

SELECT animals.name, owners.full_name FROM animals 
JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Jennifer Orwell' AND animals.name LIKE '%mon';

-- List all animals owned by Dean Winchester that haven't tried to escape.

SELECT animals.name, owners.full_name FROM animals 
JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND escape_attempts = 0;

-- Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) AS Animals_count FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY Animals_count DESC ; 