--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroids; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroids (
    asteroids_id integer NOT NULL,
    name character varying(10),
    num_of_rocks integer NOT NULL,
    spaceships_found integer,
    galaxy_id integer
);


ALTER TABLE public.asteroids OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    type text,
    other_name character varying(60),
    coordinates character varying(60) NOT NULL,
    star_num integer,
    area integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    visited boolean,
    visible boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    size text,
    habitable boolean,
    star_id integer,
    population integer,
    moon_num integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    red_dwarf boolean,
    visible_from_earth boolean NOT NULL,
    galaxy_id integer,
    planet_num integer,
    radius numeric(5,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroids; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroids VALUES (1, 'Juan', 5, 1, 4);
INSERT INTO public.asteroids VALUES (2, 'Jose', 7, 2, 1);
INSERT INTO public.asteroids VALUES (3, 'Juanita', 99, 999, 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Barrel Spiral Galaxy', 'NGC 224', '00 42 44, +41 16 09', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Sagittarius Dwarf Spheroidal Galaxy', 'Elliptical', 'Sgr De', '18 55 19.5, -30 32 43', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Canis Major Overdensity', 'Dwarf Irregular', 'CMa Dwarf', '07 12 35, -27 40 00', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Alcyoneus', 'Radio Galaxy', NULL, '08 14 21.68, +52 24 10.08', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Milky Way', 'Barrel Spiral Galaxy', NULL, '17 45 40.03599, -29 00 28.1699', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Supergiant Elliptical Galaxy', 'NGC 4486', '12 30 49.4, +12 23 28', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', true, true, 12);
INSERT INTO public.moon VALUES (3, 'Deimos', false, true, 12);
INSERT INTO public.moon VALUES (4, 'Io', true, false, 4);
INSERT INTO public.moon VALUES (5, 'Europa', true, true, 4);
INSERT INTO public.moon VALUES (6, 'Genimede', false, false, 4);
INSERT INTO public.moon VALUES (7, 'Kalysto', false, true, 4);
INSERT INTO public.moon VALUES (8, 'Amalthea', true, false, 4);
INSERT INTO public.moon VALUES (9, 'Himalista', true, true, 4);
INSERT INTO public.moon VALUES (10, 'Charon', false, false, 2);
INSERT INTO public.moon VALUES (11, 'Nix', false, false, 2);
INSERT INTO public.moon VALUES (12, 'Hydra', false, false, 2);
INSERT INTO public.moon VALUES (13, 'Kerberos', false, false, 2);
INSERT INTO public.moon VALUES (14, 'Styx', false, false, 2);
INSERT INTO public.moon VALUES (15, 'Mimas', true, true, 5);
INSERT INTO public.moon VALUES (16, 'Enceladus', true, false, 5);
INSERT INTO public.moon VALUES (17, 'Dione', true, false, 5);
INSERT INTO public.moon VALUES (18, 'Rhea', true, false, 5);
INSERT INTO public.moon VALUES (19, 'Hiapetus', false, false, 5);
INSERT INTO public.moon VALUES (20, 'Phoebe', false, false, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'normal', true, 1, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Pluto', 'dwarf', false, 1, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Namek', 'Normal', true, 3, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'God', false, 1, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Titan', false, 1, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Krypto', 'normal', true, 5, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Dune', 'normal', true, 4, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Cybertron', 'Titan', false, 5, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Arda', 'hobbit', true, 2, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Terra Prime', 'Normal', true, 2, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Venus', 'normal', false, 1, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Mars', 'small', NULL, 1, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', false, true, 5, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Death Star', false, false, 6, NULL, NULL);
INSERT INTO public.star VALUES (3, 'North Star', false, true, 4, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Scorpio', false, true, 3, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Capricorn', false, true, 2, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Sauron', true, false, 1, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroids asteroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_name_key UNIQUE (name);


--
-- Name: asteroids asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroids_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroids asteroids_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
