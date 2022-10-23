INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES (1,'Agumon', '2020/02/03', 0, false, 10.23);

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES (2,'Gabumon', '2018/11/18', 2, true, 8);

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES (3,'Pikachu', '2021/01/07', 1, false, 15.04);

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES (4,'Devimon', '2017/05/12', 5, true, 11);

--insert multiple values

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES (5,'Charmander','2020/2/8',0,false,11),
(6,'Plantmon','2021/11/15',2,true,5.7),
(7,'Squirtle','1993/4/2',3,false,12.13),
(8,'Angemon','2005/6/12',1,false,45),
(9,'Boarmon','2005/6/7',7,true,20.4),
(10,'Blossom','1998/10/13',3,true,17),
(11,'Ditto','2022/5/14',4,true,22);

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);
INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id =2 WHERE name LIKE '%mon';
UPDATE animals SET species_id =1 WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name ='Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name ='Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name ='Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name ='Boarmon';

INSERT INTO vets (name, age, date_of_graduation ) VALUES ('Vet William Tatcher', 45, '2000/4/23' ),
('Vet Maisy Smith', 26, '2019/01/17'), ('Vet Stephene Mendez', 64, '1981/05/04'), ('Vet Jack Harkness', 38, '2008/06/08');

