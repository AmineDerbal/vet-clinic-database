/* Database schema to keep the structure of entire database. */

-- 1st day project
CREATE TABLE animals (
  id int GENERATED ALWAYS AS IDENTITY,
  name varchar(50),
  date_of_birth date,
  escape_attempt int,
  neutered boolean,
  weight_kg decimal,
  primary key(id)
);

--2nd day project
-- add column species of type string to animals table
ALTER TABLE animals ADD COLUMN species varchar(30);

--3rd day project
-- create table owners
CREATE Table owners (
  id int GENERATED ALWAYS AS IDENTITY,
  full_name varchar(70),
  age int,
  primary key(id)
);

-- create table species
CREATE TABLE species (
   id int GENERATED ALWAYS AS IDENTITY,
   name varchar(60),
  primary key(id)
);

-- Alter animal table delete column species 
ALTER TABLE animals DROP COLUMN species;

-- Alter animal table add column species_id foreign key referencing species table
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD CONSTRAINT FK_species FOREIGN KEY(species_id) REFERENCES species(id);

-- Alter animal table add column owner_id foreign key referencing owners table
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD CONSTRAINT FK_owners FOREIGN KEY(owner_id) REFERENCES owners(id);


-- 4th day project 
-- Create table vets
CREATE TABLE  vets (
  id int GENERATED ALWAYS AS IDENTITY,
  name varchar(60),
  age int,
  date_of_graduation date,
  primary key(id)
);

-- Create table specializations
CREATE TABLE specializations (
  id int primary key GENERATED ALWAYS AS IDENTITY,
  species_id int REFERENCES species(id),
  vets_id int REFERENCES vets(id) 
);

-- Create table visits
CREATE TABLE visits (
  id int primary key GENERATED ALWAYS AS IDENTITY,
  animals_id int REFERENCES animals(id),
  vets_id int REFERENCES vets(id),
  visit_date date
);

/* project 4th module 2nd week performance audit */

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX animals_id_index ON visits (animals_id);

