BEGIN;

CREATE TABLE IF NOT EXISTS public.dim_jnk_person_charac
(
    dim_junk_charac_cod bigint NOT NULL,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    desc_instr character varying(255),
    desc_sexo character varying(255),
    desc_raca character varying(255),
    desc_def character varying(255)
);

CREATE TABLE IF NOT EXISTS public.dim_date
(
    dim_date_code bigint NOT NULL,
    month integer,
    year bigint,
    PRIMARY KEY (dim_date_code)
);

CREATE TABLE IF NOT EXISTS public.dim_localidade
(
    dim_localidade_cod bigint NOT NULL,
    estado character varying(255),
    cidade character varying(255),
    PRIMARY KEY (dim_localidade_cod)
);

CREATE TABLE IF NOT EXISTS public.fato_registro
(
    fato_cod bigint NOT NULL,
    saldo integer,
    salario double precision,
    horascontratuais integer,
    indicadoraprendiz boolean,
    indtrabintermitente boolean,
    indtrabparcial boolean,
    dim_jnk_person_charac bigint NOT NULL,
    dim_localidade_cod bigint,
    dim_date_cod bigint,
    PRIMARY KEY (fato_cod)
);

ALTER TABLE public.fato_registro
    ADD FOREIGN KEY (dim_jnk_person_charac)
    REFERENCES public.dim_jnk_person_charac (dim_junk_charac_cod)
    NOT VALID;


ALTER TABLE public.fato_registro
    ADD FOREIGN KEY (dim_localidade_cod)
    REFERENCES public.dim_localidade (dim_localidade_cod)
    NOT VALID;


ALTER TABLE public.fato_registro
    ADD FOREIGN KEY (dim_date_cod)
    REFERENCES public.dim_date (dim_date_code)
    NOT VALID;

END;
