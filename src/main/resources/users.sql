--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;

SET lock_timeout = 0;

SET client_encoding = 'UTF8';

SET standard_conforming_strings = on;

SET check_function_bodies = false;

SET client_min_messages = warning;

SET row_security = off;

CREATE SEQUENCE user_sequence START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE user_sequence OWNER TO postgres;

CREATE TABLE public.users (id bigint NOT NULL DEFAULT NEXTVAL('user_sequence'), username character varying(255), password character varying(255), email character varying(255), isadmin smallint, created timestamp without time zone default NOW(), updated timestamp without time zone default NOW(), CONSTRAINT user_primarykey PRIMARY KEY (id)) WITH ( OIDS=FALSE );

ALTER TABLE public.users OWNER TO postgres;

INSERT INTO users (id, username, password, email, isadmin, created, updated) VALUES (nextval('user_sequence'), 'admin', 'admin123', 'admin@localhost.com', 1, NOW(), NOW());
INSERT INTO users (id, username, password, email, isadmin, created, updated) VALUES (nextval('user_sequence'), 'guest', '123', 'user@localhost.com', 0, NOW(), NOW());
