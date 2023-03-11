/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (id INT, name CHAR(250), date_of_birth DATE, escape_attempts INT, neutered BOOLEAN, weight_kg DECIMAL);
ALTER TABLE animals ADD COLUMN species CHAR(250);

CREATE TABLE owners (id SERIAL PRIMARY KEY, full_name CHAR(250), age INT);

CREATE TABLE species (id SERIAL PRIMARY KEY, name CHAR(250) NOT NULL);

ALTER TABLE animals DROP COLUMN id;

ALTER TABLE animals ADD COLUMN id SERIAL PRIMARY KEY;

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT, ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals ADD COLUMN owner_id INT, ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE vets (id serial PRIMARY KEY, name VARCHAR(100), age INT, date_of_graduation DATE);

CREATE TABLE specializations (species_id INT REFERENCES species(id), vet_id INT REFERENCES vets(id));

CREATE TABLE visits (animal_id INT REFERENCES animals(id), vet_id INT REFERENCES vets(id), visited_date date NOT NULL DEFAULT CURRENT_DATE);