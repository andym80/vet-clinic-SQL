/* Database schema to keep the structure of entire database. */

-- Table: public.animals

-- DROP TABLE IF EXISTS public.animals;

CREATE TABLE IF NOT EXISTS public.animals
(
    id integer NOT NULL,
    name name COLLATE pg_catalog."C" NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weight_kg numeric(1000,0) NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.animals
    OWNER to postgres;
