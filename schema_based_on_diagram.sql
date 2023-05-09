
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

-- create table invoices 
CREATE TABLE invoices(
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount decimal,
  generated_at timestamp,
  payed_at timestamp,
  medical_history_id int,
  primary key(id),
  CONSTRAINT fk_medical_history
  FOREIGN KEY(medical_history_id)
  REFERENCES medical_histories(id)
);

--create table treatments
CREATE TABLE treatments(
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(255),
  name VARCHAR(255),
  primary key(id)
);

-- create table invoice_items
CREATE TABLE invoice_items(
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price decimal,
  quantity int,
  total_price decimal,
  invoice_id int,
  treatment_id int,
  primary key(id),
  CONSTRAINT fk_invoices
  FOREIGN KEY (invoice_id)
  REFERENCES invoices(id),
  CONSTRAINT fk_treatments
  FOREIGN KEY (treatment_id)
  REFERENCES treatments(id)
);

-- create table treatment_history
CREATE TABLE treatment_history(
  treatment_id int,
  medical_history_id int,
  primary key(treatment_id, medical_history_id),
  CONSTRAINT fk_treatment
  FOREIGN KEY (treatment_id)
  REFERENCES treatments(id),
  CONSTRAINT fk_medical_history
  FOREIGN KEY (medical_history_id)
  REFERENCES medical_histories(id)
);