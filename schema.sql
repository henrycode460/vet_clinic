
CREATE TABLE vets (
   id SERIAL PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE
);

CREATE TABLE specializations (
   id SERIAL PRIMARY KEY,
   species_id INT,
   vet_id INT 
   
);

CREATE TABLE visits (
   id SERIAL PRIMARY KEY,
  vet_id INT,
  animals_id INT,
  date_of_visit DATE
  
);





ALTER TABLE specializations ADD CONSTRAINT fk_constraint FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE specializations ADD CONSTRAINT fk_constraints FOREIGN KEY (vet_id) REFERENCES vets (id);

ALTER TABLE visits ADD CONSTRAINT fk_visit FOREIGN KEY (vet_id) REFERENCES vets (id);

ALTER TABLE visits ADD CONSTRAINT fk_visits FOREIGN KEY (animals_id) REFERENCES animals (id);