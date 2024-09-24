--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation character varying(30),
    origin character varying(90),
    notes text
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
    name character varying(30),
    year_discovered integer NOT NULL,
    distance_from_sun integer NOT NULL,
    takes_one_day_or_more_to_spin boolean NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(30),
    star_id integer NOT NULL,
    distance_from_sun integer NOT NULL,
    diameter integer NOT NULL
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
-- Name: planets_moons; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planets_moons (
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planets_moons_id integer NOT NULL
);


ALTER TABLE public.planets_moons OWNER TO freecodecamp;

--
-- Name: planets_moons_planets_moons_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_moons_planets_moons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_moons_planets_moons_id_seq OWNER TO freecodecamp;

--
-- Name: planets_moons_planets_moons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_moons_planets_moons_id_seq OWNED BY public.planets_moons.planets_moons_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer,
    constellation character varying(30),
    is_pretty boolean NOT NULL,
    how_far_away numeric
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
-- Name: planets_moons planets_moons_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_moons ALTER COLUMN planets_moons_id SET DEFAULT nextval('public.planets_moons_planets_moons_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'andromeda', 'andromeda', 'test', 'test');
INSERT INTO public.galaxy VALUES (2, 'backward', 'centaurus', 'test', 'test');
INSERT INTO public.galaxy VALUES (3, 'bear paw', 'lynx', 'test', 'test');
INSERT INTO public.galaxy VALUES (4, 'black eye', 'coma berenices', 'test', 'test');
INSERT INTO public.galaxy VALUES (5, 'cigar', 'ursa major', 'test', 'test');
INSERT INTO public.galaxy VALUES (6, 'hoag project', 'serpens caput', 'test', 'test');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (4, 'S/2009 S1', 2009, 117000, false, 1);
INSERT INTO public.moon VALUES (5, 'Pan', 1981, 133600, false, 2);
INSERT INTO public.moon VALUES (6, 'Daphnis', 2005, 136500, false, 2);
INSERT INTO public.moon VALUES (7, 'Atlas', 1980, 137700, false, 2);
INSERT INTO public.moon VALUES (8, 'Prometheus', 1980, 139400, false, 3);
INSERT INTO public.moon VALUES (9, 'Pandora', 1980, 141700, false, 3);
INSERT INTO public.moon VALUES (10, 'Epimetheus', 1980, 151400, false, 3);
INSERT INTO public.moon VALUES (11, 'Janus', 1980, 151500, false, 4);
INSERT INTO public.moon VALUES (12, 'Aegaeon', 2008, 167500, false, 4);
INSERT INTO public.moon VALUES (13, 'Mimas', 1789, 185539, false, 4);
INSERT INTO public.moon VALUES (14, 'Methone', 2004, 194000, false, 4);
INSERT INTO public.moon VALUES (15, 'Anthe', 2004, 197700, true, 4);
INSERT INTO public.moon VALUES (16, 'Pallene', 2004, 211000, true, 5);
INSERT INTO public.moon VALUES (17, 'Enceladus', 1789, 238042, true, 5);
INSERT INTO public.moon VALUES (18, 'Tethys', 1684, 294672, true, 5);
INSERT INTO public.moon VALUES (19, 'Calypso', 1980, 294720, true, 5);
INSERT INTO public.moon VALUES (20, 'Telesto', 1980, 294720, true, 6);
INSERT INTO public.moon VALUES (21, 'Polydeuces', 2004, 377220, true, 7);
INSERT INTO public.moon VALUES (22, 'Dione', 1684, 377415, true, 8);
INSERT INTO public.moon VALUES (23, 'Helene', 1980, 377440, true, 9);
INSERT INTO public.moon VALUES (24, 'Rhea', 1672, 527068, true, 10);
INSERT INTO public.moon VALUES (25, 'Titan', 1655, 1221865, true, 11);
INSERT INTO public.moon VALUES (26, 'Hyperion', 1848, 1500933, true, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', 1, 35982973, 3032);
INSERT INTO public.planet VALUES (2, 'venus', 2, 6723793, 7521);
INSERT INTO public.planet VALUES (3, 'earth', 2, 9295461, 7918);
INSERT INTO public.planet VALUES (4, 'mars', 3, 14162474, 4212);
INSERT INTO public.planet VALUES (5, 'jupiter', 3, 48378081, 86881);
INSERT INTO public.planet VALUES (6, 'saturn', 4, 89075397, 74898);
INSERT INTO public.planet VALUES (7, 'uranus', 4, 178486334, 31518);
INSERT INTO public.planet VALUES (8, 'neptune', 4, 279309992, 30599);
INSERT INTO public.planet VALUES (9, 'ceres', 4, 25740977, 583);
INSERT INTO public.planet VALUES (10, 'pluto', 5, 364723401, 1476);
INSERT INTO public.planet VALUES (11, 'haumea', 5, 400790508, 1014);
INSERT INTO public.planet VALUES (12, 'makemake', 5, 422296159, 891);
INSERT INTO public.planet VALUES (13, 'eris', 6, 630815839, 1445);


--
-- Data for Name: planets_moons; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planets_moons VALUES (1, 4, 'mercury', 1);
INSERT INTO public.planets_moons VALUES (2, 7, 'venus', 2);
INSERT INTO public.planets_moons VALUES (3, 10, 'earth', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'lynx', 1, 'xo-5', true, 6123.343);
INSERT INTO public.star VALUES (2, 'eridanus', 2, 'eridani a', true, 123.34);
INSERT INTO public.star VALUES (3, 'scorpius', 3, 'scorpii aa', false, 7123.613);
INSERT INTO public.star VALUES (4, 'crux', 4, 'crucis aa', false, 1612.22);
INSERT INTO public.star VALUES (5, 'taurus', 5, 'tauri aa', true, 11.613);
INSERT INTO public.star VALUES (6, 'carina', 6, 'hd 95086', true, 612.663);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planets_moons_planets_moons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_moons_planets_moons_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planets_moons planets_moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_moons
    ADD CONSTRAINT planets_moons_pkey PRIMARY KEY (planets_moons_id);


--
-- Name: planets_moons planets_moons_planets_moons_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_moons
    ADD CONSTRAINT planets_moons_planets_moons_id_key UNIQUE (planets_moons_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

