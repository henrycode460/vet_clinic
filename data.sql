/* INSERTING DATA  */

-- Insert the following data into the owners table: 

INSERT INTO vets  (name, age, date_of_graduation) VALUES ( 'Vet William Tatcher', 45, '2000-04-23'), ( 'Vet Maisy Smith', 26, '2019-01-17'),
( 'Vet Stephanie Mendez',  64, '1981-05-04'), ( 'Vet Jack Harkness',  38, '2008-06-08');



-- Vet William Tatcher is specialized in Pokemon.
INSERT INTO specializations(vet_id, species_id)
VALUES((SELECT id FROM vets WHERE vets.name = 'Vet William Tatcher'), (SELECT id FROM species WHERE species.name = 'Pokemon')),
      ((SELECT id FROM vets WHERE vets.name = 'Vet Stephanie Mendez'), (SELECT id FROM species WHERE species.name = 'Pokemon')),
      ((SELECT id FROM vets WHERE vets.name = 'Vet Stephanie Mendez'), (SELECT id FROM species WHERE species.name = 'Digimon')),
      ((SELECT id FROM vets WHERE vets.name = 'Vet Jack Harkness'), (SELECT id FROM species WHERE species.name = 'Digimon'));

-- All other animals are Pokemon

INSERT INTO visits(animals_id, vet_id, date_of_visit)
VALUES((SELECT id FROM animals WHERE animals.name = 'Agumon'), (SELECT id FROM vets WHERE vets.name = 'Vet William Tatcher'), '2020-05-24'),
      ((SELECT id FROM animals WHERE animals.name = 'Agumon'), (SELECT id FROM vets WHERE vets.name = 'Vet Stephanie Mendez'), '2020-06-22'),
      ((SELECT id FROM animals WHERE animals.name = 'Gabumon'), (SELECT id FROM vets WHERE vets.name = 'Vet Jack Harkness'), '2021-02-02'),
      ((SELECT id FROM animals WHERE animals.name = 'Pikachu'), (SELECT id FROM vets WHERE vets.name = 'Vet Maisy Smith'), '2020-01-05'),
      ((SELECT id FROM animals WHERE animals.name = 'Pikachu'), (SELECT id FROM vets WHERE vets.name = 'Vet Maisy Smith'), '2020-03-08'),
      ((SELECT id FROM animals WHERE animals.name = 'Pikachu'), (SELECT id FROM vets WHERE vets.name = 'Vet Maisy Smith'), '2020-05-14'),
      ((SELECT id FROM animals WHERE animals.name = 'Devimon'), (SELECT id FROM vets WHERE vets.name = 'Vet Stephanie Mendez'), '2021-05-04'),
      ((SELECT id FROM animals WHERE animals.name = 'Charmander'), (SELECT id FROM vets WHERE vets.name = 'Vet Jack Harkness'), '2021-02-24'),
      ((SELECT id FROM animals WHERE animals.name = 'Plantmon'), (SELECT id FROM vets WHERE vets.name = 'Vet Maisy Smith'), '2019-12-21'),
      ((SELECT id FROM animals WHERE animals.name = 'Plantmon'), (SELECT id FROM vets WHERE vets.name = 'Vet William Tatcher'), '2020-08-10'),
      ((SELECT id FROM animals WHERE animals.name = 'Plantmon'), (SELECT id FROM vets WHERE vets.name = 'Vet Maisy Smith'), '2021-04-07'),
      ((SELECT id FROM animals WHERE animals.name = 'Squirtle'), (SELECT id FROM vets WHERE vets.name = 'Vet Stephanie Mendez'), '2019-09-29'),
      ((SELECT id FROM animals WHERE animals.name = 'Agumon'), (SELECT id FROM vets WHERE vets.name = 'Vet Jack Harkness'), '2020-10-03'),
      ((SELECT id FROM animals WHERE animals.name = 'Agumon'), (SELECT id FROM vets WHERE vets.name = 'Vet Jack Harkness'), '2020-11-04'),
      ((SELECT id FROM animals WHERE animals.name = 'Boarmon'), (SELECT id FROM vets WHERE vets.name = 'Vet Maisy Smith'), '2019-01-24'),
      ((SELECT id FROM animals WHERE animals.name = 'Boarmon'), (SELECT id FROM vets WHERE vets.name = 'Vet Maisy Smith'), '2019-05-15'),
      ((SELECT id FROM animals WHERE animals.name = 'Boarmon'), (SELECT id FROM vets WHERE vets.name = 'Vet Maisy Smith'), '2020-02-27'),
      ((SELECT id FROM animals WHERE animals.name = 'Boarmon'), (SELECT id FROM vets WHERE vets.name = 'Vet Maisy Smith'), '2020-08-03'),
      ((SELECT id FROM animals WHERE animals.name = 'Blossom'), (SELECT id FROM vets WHERE vets.name = 'Vet Stephanie Mendez'), '2020-05-24'),
      ((SELECT id FROM animals WHERE animals.name = 'Blossom'), (SELECT id FROM vets WHERE vets.name = 'Vet William Tatcher'), '2021-01-11');

-- ------------------------------------------------------------------------------------------------------
-- Data Optmization and Perfromence 

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animals_id, (SELECT id FROM vets) vets_id, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';