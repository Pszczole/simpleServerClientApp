--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-07 22:25:29

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

--
-- TOC entry 3341 (class 1262 OID 16562)
-- Name: insuranceCompany; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "insuranceCompany" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Polish_Poland.1250';


ALTER DATABASE "insuranceCompany" OWNER TO postgres;

\connect "insuranceCompany"

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

--
-- TOC entry 216 (class 1259 OID 16578)
-- Name: insurance_offers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insurance_offers (
    id bigint NOT NULL,
    vehicle_id bigint NOT NULL,
    insurer text NOT NULL,
    price numeric NOT NULL,
    insert_time timestamp with time zone NOT NULL
);


ALTER TABLE public.insurance_offers OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16563)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    nick text NOT NULL,
    login text NOT NULL,
    password text NOT NULL,
    insert_time timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16571)
-- Name: vehicles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicles (
    id bigint NOT NULL,
    login text NOT NULL,
    brand text NOT NULL,
    model text NOT NULL,
    insert_time time with time zone NOT NULL
);


ALTER TABLE public.vehicles OWNER TO postgres;

--
-- TOC entry 3335 (class 0 OID 16578)
-- Dependencies: 216
-- Data for Name: insurance_offers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.insurance_offers VALUES (1, 1, 'PZU', 900, '2023-05-05 12:20:16.993037+02');
INSERT INTO public.insurance_offers VALUES (2, 2, 'PZU', 950, '2023-05-05 12:20:16.993037+02');
INSERT INTO public.insurance_offers VALUES (3, 3, 'Link4 TU', 1000, '2023-05-05 12:20:16.993037+02');
INSERT INTO public.insurance_offers VALUES (4, 4, 'TUiR WARTA', 1200, '2023-05-05 12:20:16.993037+02');
INSERT INTO public.insurance_offers VALUES (5, 5, 'Pocztowe TUW', 500, '2023-05-05 12:20:16.993037+02');
INSERT INTO public.insurance_offers VALUES (6, 6, 'Generali TU', 880, '2023-05-05 12:20:16.993037+02');
INSERT INTO public.insurance_offers VALUES (7, 1, 'Generali TU', 902, '2023-05-05 12:20:16.993037+02');
INSERT INTO public.insurance_offers VALUES (8, 2, 'Generali TU', 520, '2023-05-05 12:20:16.993037+02');
INSERT INTO public.insurance_offers VALUES (9, 3, 'Link4 TU', 1300, '2023-05-05 12:20:16.993037+02');


--
-- TOC entry 3333 (class 0 OID 16563)
-- Dependencies: 214
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'janek12', 'janek', 'krzeslo', '2023-05-05 11:59:56.993037+02');
INSERT INTO public.users VALUES (2, 'marek12', 'marek', 'stol', '2023-05-05 11:59:56.993037+02');
INSERT INTO public.users VALUES (3, 'bartek12', 'bartek', 'biurko', '2023-05-05 11:59:56.993037+02');
INSERT INTO public.users VALUES (4, 'miłosz12', 'miłosz', 'krzeslo', '2023-05-05 11:59:56.993037+02');


--
-- TOC entry 3334 (class 0 OID 16571)
-- Dependencies: 215
-- Data for Name: vehicles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.vehicles VALUES (1, 'janek', 'Audi', 'q3', '12:09:26.993037+02');
INSERT INTO public.vehicles VALUES (2, 'marek', 'Audi', 'q7', '12:09:26.993037+02');
INSERT INTO public.vehicles VALUES (3, 'marek', 'Audi', 'a3', '12:09:26.993037+02');
INSERT INTO public.vehicles VALUES (4, 'bartek', 'Volkswagen', 'Golf', '12:09:26.993037+02');
INSERT INTO public.vehicles VALUES (5, 'bartek', 'Volkswagen', 'Polo', '12:09:26.993037+02');
INSERT INTO public.vehicles VALUES (6, 'miłosz', 'Volkswagen', 'Passat', '12:09:26.993037+02');


--
-- TOC entry 3188 (class 2606 OID 16584)
-- Name: insurance_offers insurance_offers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurance_offers
    ADD CONSTRAINT insurance_offers_pkey PRIMARY KEY (id);


--
-- TOC entry 3182 (class 2606 OID 16591)
-- Name: users unique_login; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_login UNIQUE (login);


--
-- TOC entry 3184 (class 2606 OID 16570)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3186 (class 2606 OID 16577)
-- Name: vehicles vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (id);


--
-- TOC entry 3190 (class 2606 OID 16585)
-- Name: insurance_offers insurance_offers_vehicles_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurance_offers
    ADD CONSTRAINT insurance_offers_vehicles_fkey FOREIGN KEY (vehicle_id) REFERENCES public.vehicles(id) NOT VALID;


--
-- TOC entry 3189 (class 2606 OID 16592)
-- Name: vehicles vehicles_users_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_users_fkey FOREIGN KEY (login) REFERENCES public.users(login) NOT VALID;


-- Completed on 2023-05-07 22:25:30

--
-- PostgreSQL database dump complete
--

