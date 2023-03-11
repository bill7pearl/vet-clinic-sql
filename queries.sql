/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals WHERE RIGHT(name, 3) = 'mon';
SELECT name FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;
SELECT name FROM animals WHERE neutered AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species ='digimon' WHERE RIGHT(name, 3) = 'mon';
UPDATE animals SET species = 'pokemon' WHERE RIGHT(name, 3) != 'mon';
select * from animals;
COMMIT;
select * from animals;

BEGIN;
DELETE FROM animals;
select * from animals;
ROLLBACK;
select * from animals;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-1-1';
SAVEPOINT prep
UPDATE animals
SET weight_kg = weight_kg * -1;
select * from animals;
ROLLBACK TO pre_point;
select * from animals;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
select * from animals;
COMMIT;
select * from animals;

select COUNT(*) FROM animals;
select COUNT(*) FROM animals WHERE escape_attempts = 0;
select AVG(weight_kg) FROM animals;
select neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
select species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
select species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-12-31' GROUP BY species;

SELECT animals.name, owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody';
SELECT animals.name AS animal_name, species.name AS species_type FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals ON animals.owner_id = owners.id;
SELECT species.name, count(animals) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT owners.full_name, species.name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE species.name = 'Digimon'and owners.full_name = 'Jennifer Orwell';
SELECT species.name, count(animals) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name, owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE animals.escape_attempts=0 and owners.full_name = 'Dean Winchester';
SELECT owners.full_name, COUNT(animals.name) AS total_animals FROM owners JOIN animals ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY total_animals DESC LIMIT 1;

SELECT animals.name, vets.name, visits.visited_date FROM animals JOIN visits on animals.id = visits.animal_id JOIN vets on visits.vet_id = vets.id WHERE vets.name = 'William Tatcher' ORDER BY visits.visited_date DESC lIMIT 1;
SELECT vets.name, count(animals.name) FROM animals JOIN visits on visits.animal_id = animals.id JOIN vets on vets.id = visits.vet_id WHERE vets.name = 'Stephanie Mendez' GROUP BY vets.name;
SELECT vets.name, species.name FROM vets LEFT JOIN specializations on specializations.vet_id = vets.id LEFT JOIN species on specializations.species_id = species.id;
SELECT animals.name, vets.name, visits.visited_date FROM animals JOIN visits on visits.animal_id = animals.id JOIN vets on vets.id = visits.vet_id WHERE vets.name = 'Stephanie Mendez' AND visits.visited_date BETWEEN '2020-04-01' AND '2020-08-30';
SELECT animals.name, count(*) FROM animals JOIN visits on visits.animal_id = animals.id GROUP BY animals.name ORDER BY count desc limit 1;
SELECT animals.name, vets.name, visits.visited_date FROM animals JOIN visits on animals.id = visits.animal_id JOIN vets on visits.vet_id = vets.id WHERE vets.name = 'Maisy Smith' ORDER BY visits.visited_date ASC lIMIT 1;
SELECT animals.name, vets.name, visits.visited_date FROM animals JOIN visits on animals.id = visits.animal_id JOIN vets on visits.vet_id = vets.id ORDER BY visits.visited_date DESC lIMIT 1;
SELECT COUNT(*) FROM vets JOIN visits ON visits.vet_id = vets.id JOIN animals ON visits.animal_id = animals.id JOIN specializations ON vets.id = specializations.vet_id WHERE NOT specializations.species_id = animals.species_id;
SELECT vets.name, species.name, count(species.name) from vets JOIN visits on visits.vet_id = vets.id JOIN animals on visits.animal_id = animals.id JOIN species on animals.species_id = species.id WHERE vets.name = 'Maisy Smith' GROUP BY species.name, vets.name ORDER BY count DESC lIMIT 1;