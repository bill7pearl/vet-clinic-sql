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

