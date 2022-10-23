CREATE TABLE IF NOT EXISTS owners
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT owners_pkey PRIMARY KEY (id)
);
ALTER TABLE owners ADD COLUMN age integer;


CREATE TABLE IF NOT EXISTS species
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT species_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS animals
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name name COLLATE pg_catalog."C" NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weight_kg numeric(1000,0) NOT NULL,
    species_id integer NOT NULL,
    owner_id integer NOT NULL,
    CONSTRAINT animals_pkey PRIMARY KEY (id),
    CONSTRAINT fk_animals_species FOREIGN KEY (species_id)
        REFERENCES species (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT fk_animals_owners FOREIGN KEY (owner_id)
        REFERENCES owners (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE

);

ALTER TABLE animals ADD COLUMN species_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals ADD COLUMN owner_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE vets (id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(250), age INT, date_of_graduation DATE, PRIMARY KEY(id));

CREATE TABLE specialization (species_id INT, vets_id INT, PRIMARY KEY (species_id, vets_id),
  CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);

CREATE TABLE visits (id INT GENERATED ALWAYS AS IDENTITY, animal_id INT, vet_id INT, date_of_visit DATE, PRIMARY KEY(id),
  CONSTRAINT fk_animal_id FOREIGN KEY(animal_id) REFERENCES animals(id),
  CONSTRAINT fk_vet_id FOREIGN KEY(vet_id) REFERENCES vets(id)
);










