/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempt,neutered,weight_kg) VALUES ('Agumon','2020-02-03',0,true,10.23);
INSERT INTO animals (name,date_of_birth,escape_attempt,neutered,weight_kg) VALUES ('Gabumon','2018-11-15',2,true,8);
INSERT INTO animals (name,date_of_birth,escape_attempt,neutered,weight_kg) VALUES ('Pikachu','2021-01-07',1,false,15.04);
INSERT INTO animals (name,date_of_birth,escape_attempt,neutered,weight_kg) VALUES ('Devimon','2017-05-12',5,true,11);


/* Insert new data */
INSERT INTO animals (name,date_of_birth,escape_attempt,neutered,weight_kg) VALUES ('Charmander','2020-02-08',0,false,-11);
INSERT INTO animals (name,date_of_birth,escape_attempt,neutered,weight_kg) VALUES ('Plantmon','2021-11-15',2,true,-5.7);
INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempt) VALUES ('Squirtle','1993-04-02',-12.13,false,3);
INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempt) VALUES ('Angemon','2005-06-12',-45,true,1);
INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempt) VALUES ('Boarmon','2005-06-07',20.4,true,7);
INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempt) VALUES ('Blossom','1998-10-13',17,true,3);
INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempt) VALUES ('Ditto','2022-05-14',22,true,4);

/* Insert new data into owners and species tables*/
INSERT INTO owners (full_name,age) VALUES ('Sam Smith',34);
INSERT INTO owners (full_name,age) VALUES ('Jennifer Orwell',19);
INSERT INTO owners (full_name,age) VALUES ('Bob',45);
INSERT INTO owners (full_name,age) VALUES ('Melody Pond',77);
INSERT INTO owners (full_name,age) VALUES ('Dean Winchester',14);
INSERT INTO owners (full_name,age) VALUES ('Jodie Whittake',38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');


/* modification of inserted animals species */
BEGIN WORK;
update animals SET species_id = 1 WHERE name NOT LIKE '%mon'; 
update animals SET species_id = 2 WHERE name LIKE '%mon';
COMMIT WORK;

/* modification of inserted animals owners */
BEGIN WORK;
-- Sam Smith owns Agumon
update animals SET owner_id = owners.id 
FROM owners 
WHERE animals.name='Agumon' AND owners.full_name='Sam Smith';

-- Jennifer Orwell owns Gabumon and Pikachu
update animals SET owner_id = owners.id 
FROM owners 
WHERE (owners.full_name='Jennifer Orwell') AND (animals.name='Gabumon' OR animals.name='Pikachu');

-- Bob owns Devimon and Plantmon
update animals SET owner_id = owners.id 
FROM owners 
WHERE (owners.full_name='Bob') AND (animals.name='Devimon' OR animals.name='Plantmon');

-- Melody Pond owns Charmander, Squirtle, and Blossom
update animals SET owner_id = owners.id 
FROM owners 
WHERE (owners.full_name='Melody Pond') 
AND (animals.name='Charmander' OR animals.name='Squirtle' OR animals.name='Blossom');

-- Dean Winchester owns Angemon and Boarmon
update animals SET owner_id = owners.id 
FROM owners 
WHERE (owners.full_name='Dean Winchester') AND (animals.name='Angemon' OR animals.name='Boarmon');

COMMIT WORK;


/* insert data 4th day project */

-- insert data into vets 
INSERT INTO vets (name,age,date_of_graduation) VALUES 
('William Tatcher',45,'2000,04,23'),
('Maisy Smith',26,'2019,01,17'),
('Stephanie Mendez',64,'1981,05,04'),
('Jack Harkness',38,'2008,06,08');

-- insert data into specializations 
INSERT INTO specializations (vets_id,species_id) VALUES
((SELECT id FROM vets WHERE name ='William Tatcher'),(SELECT id FROM species WHERE name='Pokemon')),
((SELECT id FROM vets WHERE name ='Stephanie Mendez'),(SELECT id FROM species WHERE name='Pokemon')),
((SELECT id FROM vets WHERE name ='Stephanie Mendez'),(SELECT id FROM species WHERE name='Digimon')),
((SELECT id FROM vets WHERE name ='Jack Harkness'),(SELECT id FROM species WHERE name='Digimon'));

-- insert data into visits 
INSERT INTO visits (animals_id,vets_id,visit_date) VALUES 
(
  (SELECT id from animals WHERE name = 'Agumon'),
  (SELECT id from vets WHERE name = 'William Tatcher'),
  ('2020,05,24')
),
(
  (SELECT id from animals WHERE name = 'Agumon'),
  (SELECT id from vets WHERE name = 'Stephanie Mendez'),
  ('2020,07,22')
),
(
  (SELECT id from animals WHERE name = 'Gabumon'),
  (SELECT id from vets WHERE name = 'Jack Harkness'),
  ('2021,02,02')
),
(
  (SELECT id from animals WHERE name = 'Pikachu'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  ('2020,01,05')
),
(
  (SELECT id from animals WHERE name = 'Pikachu'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  ('2020,03,08')
),
(
  (SELECT id from animals WHERE name = 'Pikachu'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  ('2020,05,14')
),
(
  (SELECT id from animals WHERE name = 'Devimon'),
  (SELECT id from vets WHERE name = 'Stephanie Mendez'),
  ('2021,05,04')
),
(
  (SELECT id from animals WHERE name = 'Charmander'),
  (SELECT id from vets WHERE name = 'Jack Harkness'),
  ('2021,02,24')
),
(
  (SELECT id from animals WHERE name = 'Plantmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  ('2019,12,21')
),
(
  (SELECT id from animals WHERE name = 'Plantmon'),
  (SELECT id from vets WHERE name = 'William Tatcher'),
  ('2020,08,10')
),
(
  (SELECT id from animals WHERE name = 'Plantmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  ('2021,04,07')
),
(
  (SELECT id from animals WHERE name = 'Squirtle'),
  (SELECT id from vets WHERE name = 'Stephanie Mendez'),
  ('2019,09,29')
),
(
  (SELECT id from animals WHERE name = 'Angemon'),
  (SELECT id from vets WHERE name = 'Jack Harkness'),
  ('2020,10,03')
),
(
  (SELECT id from animals WHERE name = 'Angemon'),
  (SELECT id from vets WHERE name = 'Jack Harkness'),
  ('2020,11,04')
),
(
  (SELECT id from animals WHERE name = 'Boarmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  ('2019,01,24')
),
(
  (SELECT id from animals WHERE name = 'Boarmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  ('2019,05,15')
),
(
  (SELECT id from animals WHERE name = 'Boarmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  ('2020,02,27')
),
(
  (SELECT id from animals WHERE name = 'Boarmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  ('2020,08,03')
),
(
  (SELECT id from animals WHERE name = 'Blossom'),
  (SELECT id from vets WHERE name = 'Stephanie Mendez'),
  ('2020,05,24')
),
(
  (SELECT id from animals WHERE name = 'Blossom'),
  (SELECT id from vets WHERE name = 'William Tatcher'),
  ('2021,01,11')
);