/* Database schema to keep the structure of entire database. */


CREATE TABLE animals (
  id int GENERATED ALWAYS AS IDENTITY,
  name varchar(50),
  date_of_birth date,
  escape_attempt int,
  neutered boolean,
  weight_kg decimal,
  primary key(id)
);

-- add column species of type string to animals table
ALTER TABLE animals ADD COLUMN species varchar(30);

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


