
-- create table patients 
CREATE TABLE patients(
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(255) NOT NULL,
  date_of_birth date NOT NULL,
  primary key(id)
);

