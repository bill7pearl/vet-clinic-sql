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

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34),
                                           ('Jennifer Orwell', 19),
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

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23'),
                                                        ('Maisy Smith', 26, '2019-01-17'),
                                                        ('Stephanie Mendez', 64, '1981-05-04'),
                                                        ('Jack Harness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id) VALUES (1, 1),
                                                        (3, 1),
                                                        (3, 2),
                                                        (4, 2);

INSERT INTO visits (animal_id, vet_id, visited_date) VALUES  (1, 1, '2020-05-24'),
                                                             (1, 3, '2020-07-22'),
                                                             (2, 4, '2021-02-02'),
                                                             (3, 2, '2020-01-05'),
                                                             (3, 2, '2020-03-08'),
                                                             (3, 2, '2020-05-14'),
                                                             (4, 3, '2021-05-04'),
                                                             (5, 4, '2021-02-24'),
                                                             (6, 2, '2019-12-21'),
                                                             (6, 1, '2020-08-10'),
                                                             (6, 2, '2021-04-07'),
                                                             (7, 3, '2019-09-29'),
                                                             (8, 4, '2020-10-03'),
                                                             (8, 4, '2020-11-04'),
                                                             (9, 2, '2019-01-24'),
                                                             (9, 2, '2019-05-15'),
                                                             (9, 2, '2020-02-27'),
                                                             (9, 2, '2020-08-03'),
                                                             (10, 3, '2020-05-24'),
                                                             (10, 1, '2021-01-11');                                                 