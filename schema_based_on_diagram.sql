
-- create table patients 
CREATE TABLE patients(
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(255) NOT NULL,
  date_of_birth date NOT NULL,
  primary key(id)
);

-- create table medical_histories

CREATE TABLE medical_histories(
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at timestamp,
  patient_id int,
  status varchar(255),
  primary key(id),
  CONSTRAINT fk_patient 
  FOREIGN KEY(patient_id)
  REFERENCES patients(id) 
);