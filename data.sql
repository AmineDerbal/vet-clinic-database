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