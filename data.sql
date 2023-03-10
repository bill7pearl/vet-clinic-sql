/* Populate database with sample data. */

INSERT INTO animals VALUES (1, 'Agumon', '2020-02-03', 0, 'true', 10.23);
INSERT INTO animals VALUES (3, 'Gabumon', '2018-11-15', 2, 'true', 8);
INSERT INTO animals VALUES (4, 'Pikachu', '2021-01-07', 1, 'false', 15.04);
INSERT INTO animals VALUES (5, 'Devimon', '2017-05-12', 5, 'true', 11);

INSERT INTO animals VALUES  (6, 'Charmander', 'Feb 8, 2020', 0, 'false', -11),
                            (7, 'Plantmon', 'Nov 15 2021', 2, 'true', -5.7),
                            (8, 'Squirtle', 'Apr 2, 1993', 3, 'false', -12.13),
                            (9, 'Angemon', 'Jun 12, 2005', 1, 'true', -45),
                            (10, 'Boarmon', 'Jun 7, 2005', 7, 'true', 20.4),
                            (11, 'Blossom', 'Oct 13, 1998', 3, 'true', 17),
                            (12, 'Ditto', 'May 14, 2022', 4, 'true', 22);

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34),('Jennifer Orwell', 19),
                                           ('Bob', 45),
                                           ('Melody', 77),
                                           ('Dean Winchester', 14),
                                           ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'),
                                  ('Digimon');

UPDATE animals SET species_id = species.id FROM species WHERE species.name = 'Digimon' AND animals.name LIKE '%mon';

UPDATE animals SET species_id = species.id FROM species WHERE species.name = 'Pokemon' AND animals.species_id is NULL;

UPDATE animals SET owner_id = owners.id FROM owners WHERE animals.name = 'Agumon' AND owners.full_name = 'Sam Smith';

UPDATE animals SET owner_id = owners.id FROM owners WHERE animals.name IN ('Gabumon', 'Pikachu') AND owners.full_name = 'Jennifer Orwell';

UPDATE animals SET owner_id = owners.id FROM owners WHERE animals.name IN ('Charmander', 'Squirtle', 'Blossom') AND owners.full_name = 'Melody Pond';

UPDATE animals SET owner_id = owners.id FROM owners WHERE animals.name IN ('Angemon', 'Boarmon') AND owners.full_name = 'Dean Winchester';

UPDATE animals SET owner_id = owners.id FROM owners WHERE animals.name IN ('Devimon', 'Plantmon') AND owners.full_name = 'Bob';