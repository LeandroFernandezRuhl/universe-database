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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
                               galaxy_id integer NOT NULL,
                               name character varying(255) NOT NULL,
                               type character varying(25),
                               age_in_millions_of_years integer,
                               description text
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
                             name character varying(255) NOT NULL,
                             distance_from_parent_planet numeric,
                             has_ice boolean,
                             orbital_period integer,
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
                               name character varying(255) NOT NULL,
                               age_in_millions_of_years integer,
                               has_water boolean,
                               distance_from_star numeric,
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
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
                                   spacecraft_id integer NOT NULL,
                                   name character varying(255) NOT NULL,
                                   purpose text NOT NULL,
                                   launch_year integer NOT NULL,
                                   status boolean,
                                   destination character varying(255)
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
                             star_id integer NOT NULL,
                             name character varying(255) NOT NULL,
                             age_in_millions_of_years integer,
                             mass numeric,
                             radius numeric,
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 13000, 'Home to our solar system.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2300, 'The closest large galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 400, 'Also known as M33, it is a satellite galaxy of Andromeda.');
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 'Spiral', 13000, 'One of the brightest galaxies in the night sky.');
INSERT INTO public.galaxy VALUES (5, 'Messier 82', 'Irregular', 6000, 'Also known as the Cigar Galaxy, it has an unusual shape.');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical', 12000, 'A giant elliptical galaxy with a prominent dust lane.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Pan', 17.8, false, 1, 1);
INSERT INTO public.moon VALUES (2, 'Atlas', 23.2, false, 1, 1);
INSERT INTO public.moon VALUES (3, 'Prometheus', 92.0, false, 1, 1);
INSERT INTO public.moon VALUES (4, 'Pandora', 141.7, false, 1, 1);
INSERT INTO public.moon VALUES (5, 'Neith', 1.35, false, 0, 2);
INSERT INTO public.moon VALUES (6, 'Gamil', 1.38, false, 0, 2);
INSERT INTO public.moon VALUES (7, 'Sedna', 1.4, false, 0, 2);
INSERT INTO public.moon VALUES (8, 'Luna', 0.384, true, 27, 3);
INSERT INTO public.moon VALUES (9, 'Aegaeon', 0.167, false, 1, 3);
INSERT INTO public.moon VALUES (10, 'Callisto', 1.883, true, 17, 3);
INSERT INTO public.moon VALUES (11, 'Phobos', 0.0093, false, 0, 4);
INSERT INTO public.moon VALUES (12, 'Deimos', 0.0234, false, 1, 4);
INSERT INTO public.moon VALUES (13, 'Amalthea', 181.4, false, 1, 4);
INSERT INTO public.moon VALUES (18, 'Io', 421.8, true, 2, 5);
INSERT INTO public.moon VALUES (19, 'Europa', 671.1, true, 4, 5);
INSERT INTO public.moon VALUES (20, 'Ganymede', 1070.4, true, 7, 5);
INSERT INTO public.moon VALUES (21, 'Etheldrea', 1882.7, true, 17, 5);
INSERT INTO public.moon VALUES (22, 'Himalia', 11428.0, false, 251, 5);
INSERT INTO public.moon VALUES (23, 'Lysithea', 11720.0, false, 259, 5);
INSERT INTO public.moon VALUES (24, 'Elara', 11740.0, false, 260, 5);
INSERT INTO public.moon VALUES (25, 'Ananke', 21200.0, false, 632, 5);
INSERT INTO public.moon VALUES (26, 'Carme', 22930.0, false, 693, 5);
INSERT INTO public.moon VALUES (27, 'Pasiphae', 23580.0, false, 735, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4500, false, 57.9, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4500, false, 108.2, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 4500, true, 149.6, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4500, false, 227.9, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4500, false, 778.3, 1);
INSERT INTO public.planet VALUES (6, 'Planet A', 2000, true, 2.5, 2);
INSERT INTO public.planet VALUES (7, 'Planet B', 3000, false, 5.0, 2);
INSERT INTO public.planet VALUES (8, 'Planet X', 500, true, 0.1, 4);
INSERT INTO public.planet VALUES (9, 'Planet Y', 800, false, 0.2, 4);
INSERT INTO public.planet VALUES (10, 'Rigel I', 150, true, 0.25, 6);
INSERT INTO public.planet VALUES (11, 'Rigel II', 200, false, 0.42, 6);
INSERT INTO public.planet VALUES (12, 'Rigel III', 75, false, 0.73, 6);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft VALUES (1, 'Voyager 1', 'Exploration of the outer solar system', 1977, true, 'Interstellar space');
INSERT INTO public.spacecraft VALUES (2, 'Voyager 2', 'Exploration of the outer solar system', 1977, true, 'Interstellar space');
INSERT INTO public.spacecraft VALUES (3, 'New Horizons', 'Flyby of Pluto and the Kuiper Belt', 2006, true, 'Kuiper Belt');
INSERT INTO public.spacecraft VALUES (4, 'Cassini', 'Study of Saturn and its moons', 1997, false, 'Saturn');
INSERT INTO public.spacecraft VALUES (5, 'Juno', 'Study of Jupiter and its atmosphere', 2011, true, 'Jupiter');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sirius', 250, 2.02, 1.71, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 6000, 1.1, 1.223, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 5000, 0.123, 0.141, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 8, 17.2, 887, 2);
INSERT INTO public.star VALUES (6, 'Rigel', 8, 23.2, 78.9, 2);
INSERT INTO public.star VALUES (1, 'Sun', 5, 1, 1, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 5, true);


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
-- Name: spacecraft spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_key UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


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