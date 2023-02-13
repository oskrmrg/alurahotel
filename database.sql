--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;


CREATE TABLE public.huespedes (
    id integer NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    fechanacimiento timestamp without time zone NOT NULL,
    nacionalidad text NOT NULL,
    telefono text NOT NULL,
    id_reserva integer NOT NULL
);



CREATE SEQUENCE public.huespedes_id_reserva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



ALTER SEQUENCE public.huespedes_id_reserva_seq OWNED BY public.huespedes.id_reserva;



CREATE SEQUENCE public.huespedes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



ALTER SEQUENCE public.huespedes_id_seq OWNED BY public.huespedes.id;



CREATE TABLE public.reservas (
    id integer NOT NULL,
    fechaentrada timestamp without time zone NOT NULL,
    fechasalida timestamp without time zone NOT NULL,
    valor numeric(15,2) DEFAULT 0 NOT NULL,
    formapago text NOT NULL
);



CREATE SEQUENCE public.reservas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



ALTER SEQUENCE public.reservas_id_seq OWNED BY public.reservas.id;


ALTER TABLE ONLY public.huespedes ALTER COLUMN id SET DEFAULT nextval('public.huespedes_id_seq'::regclass);


ALTER TABLE ONLY public.huespedes ALTER COLUMN id_reserva SET DEFAULT nextval('public.huespedes_id_reserva_seq'::regclass);


ALTER TABLE ONLY public.reservas ALTER COLUMN id SET DEFAULT nextval('public.reservas_id_seq'::regclass);


ALTER TABLE ONLY public.huespedes
    ADD CONSTRAINT huespedes_columns UNIQUE (id, telefono);


ALTER TABLE ONLY public.huespedes
    ADD CONSTRAINT huespedes_primaries PRIMARY KEY (id);


ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_primaries PRIMARY KEY (id);


ALTER TABLE ONLY public.huespedes
    ADD CONSTRAINT huespedes_id_reserva_fkey FOREIGN KEY (id_reserva) REFERENCES public.reservas(id) ON DELETE CASCADE;