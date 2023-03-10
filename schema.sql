/* Database schema to keep the structure of entire database. */

 CREATE TABLE animals (id INT, name CHAR(250), date_of_birth DATE, escape_attempts INT, neutered BOOLEAN, weight_kg DECIMAL);
 ALTER TABLE animals ADD COLUMN species CHAR(250);