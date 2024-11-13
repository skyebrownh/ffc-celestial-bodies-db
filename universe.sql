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
    name character varying(50) NOT NULL,
    description text,
    is_active boolean NOT NULL,
    size numeric(10,2),
    number_of_stars integer,
    circular integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    shorthand character varying(10) NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    is_active boolean NOT NULL,
    size numeric(10,2),
    number_of_rings integer,
    number_of_moons integer,
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
    name character varying(50) NOT NULL,
    description text,
    is_active boolean NOT NULL,
    size numeric(10,2),
    number_of_moons integer,
    mean_temperature integer,
    star_id integer
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
    name character varying(50) NOT NULL,
    description text,
    is_active boolean NOT NULL,
    size numeric(10,2),
    number_of_planets integer,
    subclass integer,
    galaxy_id integer
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Earth universe', true, 100000.00, 100, 4);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Biggest galaxy', true, 220000.00, 500, 1);
INSERT INTO public.galaxy VALUES (3, 'Cigar', 'In Ursa Major', true, 37000.00, 67, 2);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Near Milky Way', true, 14000.00, 31, 6);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel', 'Sculptor', false, 130000.00, 59, 4);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Norther star', false, 52000.00, 13, 3);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'S');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'E');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'Irr');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth moon', true, 2159.00, 0, 0, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars moon 1', true, 5000.00, 0, 0, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars moon 2', false, 3000.00, 0, 0, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Jupiter moon 1', false, 20000.00, 0, 5, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Jupiter moon 2', true, 14000.00, 0, 2, 5);
INSERT INTO public.moon VALUES (6, 'Io', 'Jupiter moon 3', false, 8000.00, 0, 1, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 'Jupiter moon 4', true, 5500.00, 1, 0, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn moon 1', true, 35000.00, 4, 4, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Saturn moon 2', true, 32500.00, 2, 7, 6);
INSERT INTO public.moon VALUES (10, 'Hyperion', 'Saturn moon 3', true, 22500.00, 0, 3, 6);
INSERT INTO public.moon VALUES (11, 'Prometheus', 'Saturn moon 4', true, 55000.00, 8, 6, 6);
INSERT INTO public.moon VALUES (12, 'Pandora', 'Saturn moon 5', true, 27000.00, 3, 1, 6);
INSERT INTO public.moon VALUES (13, 'Janus', 'Saturn moon 6', false, 18000.00, 0, 0, 6);
INSERT INTO public.moon VALUES (14, 'Epimetheus', 'Saturn moon 7', false, 11000.00, 1, 9, 6);
INSERT INTO public.moon VALUES (15, 'Mimas', 'Saturn moon 8', true, 4300.00, 6, 2, 6);
INSERT INTO public.moon VALUES (16, 'Miranda', 'Uranus moon 1', false, 9000.00, 0, 4, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', 'Uranus moon 2', true, 6000.00, 0, 3, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 'Uranus moon 3', true, 15000.00, 0, 10, 8);
INSERT INTO public.moon VALUES (19, 'Proteus', 'Neptune moon 2', true, 13200.00, 2, 2, 8);
INSERT INTO public.moon VALUES (20, 'Charon', 'Pluto moon 1', true, 2200.00, 0, 0, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'First to Sun', false, 3032.00, 0, 167, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Second to Sun', false, 7521.00, 0, 464, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our planet', true, 7926.00, 1, 15, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Red planet', true, 2106.00, 2, -20, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Big planet', true, 88695.00, 2, -110, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Ring planet', false, 74897.00, 146, -140, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Blue planet', false, 31763.00, 28, -195, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Blue planet', true, 30775.00, 16, -200, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Apparently not really a planet', false, 1477.00, 5, -225, 1);
INSERT INTO public.planet VALUES (10, 'Exo 1', 'exoplanet 1', true, 4500.00, 3, 254, 2);
INSERT INTO public.planet VALUES (11, 'Exo 2', 'exoplanet 2', false, 7500.00, 1, -312, 2);
INSERT INTO public.planet VALUES (12, 'Exo 3', 'exoplanet 3', true, 12000.00, 8, 5, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Earth star', true, 865000.00, 10, 1, 1);
INSERT INTO public.star VALUES (2, 'Exoplanet Star', 'Not Earth star', false, 345000.00, 5, 7, 1);
INSERT INTO public.star VALUES (3, 'Star 3', 'Not Earth star 3', true, 761000.00, 38, 3, 1);
INSERT INTO public.star VALUES (4, 'Star 4', 'Not Earth star 4', false, 50000.00, 2, 5, 2);
INSERT INTO public.star VALUES (5, 'Star 5', 'Not Earth star 5', false, 75000.00, 6, 2, 5);
INSERT INTO public.star VALUES (6, 'Star 6', 'Not Earth star 6', true, 250000.00, 86, 29, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


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
-- Name: galaxy_type galaxy_type_galaxy_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_galaxy_type_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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

