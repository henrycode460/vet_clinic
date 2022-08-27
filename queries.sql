-- Who was the last animal seen by William Tatcher?
SELECT vets.name , animals.name, date_of_visit
FROM visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON vet_id = (SELECT id FROM vets WHERE vets.name = 'Vet William Tatcher')
AND animals.id = visits.animals_id
ORDER BY date_of_visit DESC;

-- What animal has the most visits to vets?
SELECT animals.name AS Animals, COUNT(animals_id)
FROM visits
JOIN animals ON animals.id = visits.animals_id
GROUP BY animals.name
ORDER BY COUNT(animals_id) DESC;

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name,  species.name AS specialties
FROM  specializations
JOIN vets ON vets.id = specializations.vet_id
JOIN species ON species.id = specializations.species_id;

-- How many different animals did Stephanie Mendez see?
SELECT vets.name , animals.name AS Animals_Name
FROM visits
JOIN vets ON vet_id = visits.vet_id
JOIN animals ON vet_id = (SELECT id FROM vets WHERE vets.name = 'Vet Stephanie Mendez')
AND animals.id = visits.animals_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT vets.name, animals.name AS Animals_Name, date_of_visit
FROM visits
JOIN animals ON animals.id = visits.vet_id
JOIN vets ON vets.id = visits.vet_id
AND vets.name = 'Vet Stephanie Mendez'
AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';



-- Who was Maisy Smith's first visit?
SELECT vets.name, animals.name AS Animals_Name, date_of_visit
FROM visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animals_id
AND vets.name = 'Vet Maisy Smith'
ORDER BY date_of_visit;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT * FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vet_id
ORDER BY date_of_visit DESC;

-- How many visits were with a vet that did not specialize in that animal's species
SELECT COUNT(*)
FROM vets
JOIN visits ON visits.vet_id = vets.id
JOIN animals ON visits.animals_id = animals.species_id
JOIN specializations ON vets.id = specializations.vet_id
WHERE NOT specializations.species_id = animals.id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name FROM animals
JOIN species ON species.id = animals.species_id
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON vets.id = visits.vet_id AND vets.name = 'Vet Maisy Smith'
GROUP BY species.name
ORDER BY COUNT(species_id) DESC;