/*Queries that provide answers to the questions from all projects.*/

SELECT NAME
FROM ANIMALS
WHERE NAME = '%mon';


SELECT NAME
FROM ANIMALS
WHERE DATE_OF_BIRTH BETWEEN '2016/01/01' AND '2019/12/31';


SELECT NAME
FROM ANIMALS
WHERE NEUTERED = TRUE
	AND ESCAPE_ATTEMPTS < 3;


SELECT DATE_OF_BIRTH
FROM ANIMALS
WHERE NAME = 'Agumon'
	OR NAME = 'Pikachu';


SELECT NAME,
	ESCAPE_ATTEMPTS
FROM ANIMALS
WHERE WEIGHT_KG > 10.5;


SELECT *
FROM ANIMALS
WHERE NEUTERED = TRUE;


SELECT NAME
FROM ANIMALS
WHERE NAME != 'Gabumon';


SELECT *
FROM ANIMALS
WHERE WEIGHT_KG >= 10.4
	AND WEIGHT_KG <= 17.3;

BEGIN;

UPDATE ANIMALS
SET species ='unspecified';

ROLLBACK;

BEGIN;

UPDATE ANIMALS
SET species ='digimon';
WHERE NAME  LIKE '%mon';

UPDATE ANIMALS
SET species ='pokemon';
WHERE NAME NOT LIKE '%mon';

COMMIT;

BEGIN;

DELETE FROM ANIMALS;

ROLLBACK;

BEGUIN;

DELETE FROM ANIMALS
WHERE date_of_birth >= '2020/01/01';

SAVEPOINT my_savepoint;

UPDATE ANIMALS
SET weight_kg = weight_kg* -1;

ROLLBACK TO my_savepoint;


UPDATE ANIMALS
SET weight_kg = weight_kg* -1;
WHERE weight_kg < 0;

COMMIT;

SELECT * FROM ANIMALS;

SELECT COUNT(*) AS "number of animals" FROM ANIMALS;
SELECT COUNT(*) AS "never tried to escape"  FROM ANIMALS WHERE escape_attempts = 0;
SELECT MAX(escape_attempts) AS "maximal escapes neutered & non neutered" NEUTERED, NEUTERED = false, FROM ANIMALS;
SELECT AVG(weight_kg) AS "average weight of animals" FROM ANIMALS;
SELECT AVG(escape_attempts) AS "average escape attempts" FROM ANIMALS WHERE date_of_birth BETWEEN '1990/01/01' AND '1999/12/31';
SELECT MIN(weight_kg) AS "minimum weight", MAX(weight_kg) AS "maximux weight" FROM ANIMALS GROUP BY species;

--changes wednesday tasks

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);
INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id =2 WHERE name LIKE '%mon';
UPDATE animals SET species_id =1 WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' AND name ='Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' AND name ='Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' AND name ='Squirtle' AND name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' AND name ='Boarmon';

SELECT name, full_name FROM animals JOIN owners ON owner_id = 4 AND full_name = 'Melody Pond';

SELECT A.name, S.name FROM animals A JOIN species S ON A.species_id =1 AND S.name ='Pokemon';
SELECT A.name, O.full_name FROM animals A FULL JOIN owners O ON A.owner_id = O.id;
SELECT S.name, COUNT(species_id) FROM animals A JOIN species S ON A.species_id = S.id GROUP BY S.name;

SELECT * FROM ( SELECT owners.full_name as owner,
COUNT(*) count_animals FROM animals
RIGHT JOIN owners ON owners.id = animals.owner_id
GROUP BY owners.full_name) AS count_animals_per_owner
WHERE count_animals_per_owner.count_animals = (
SELECT MAX(count_per_species) FROM (
SELECT owners.full_name as owner,
COUNT(*) count_per_species FROM animals RIGHT JOIN owners ON owners.id = animals.owner_id
GROUP BY owners.full_name) AS count_animals_per_owner);

