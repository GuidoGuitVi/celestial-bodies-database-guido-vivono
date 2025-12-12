--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid_belt; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid_belt (
    asteroid_belt_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    number_of_asteroids integer NOT NULL,
    description text
);


ALTER TABLE public.asteroid_belt OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_belt_asteroid_belt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_belt_asteroid_belt_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_belt_asteroid_belt_id_seq OWNED BY public.asteroid_belt.asteroid_belt_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer,
    type character varying(100)
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
    planet_id integer NOT NULL,
    diameter_km integer,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text
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
    star_id integer NOT NULL,
    mass_in_earths numeric,
    diameter_km integer,
    has_life boolean NOT NULL,
    description text
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    mass_in_solar numeric,
    has_planets boolean NOT NULL,
    description text
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
-- Name: asteroid_belt asteroid_belt_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt ALTER COLUMN asteroid_belt_id SET DEFAULT nextval('public.asteroid_belt_asteroid_belt_id_seq'::regclass);


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
-- Data for Name: asteroid_belt; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid_belt VALUES (1, 'Main Asteroid Belt', 5, 2000000, 'Located between Mars and Jupiter');
INSERT INTO public.asteroid_belt VALUES (2, 'Kuiper Belt', 7, 100000, 'Region beyond Neptune with icy bodies');
INSERT INTO public.asteroid_belt VALUES (3, 'Hector Belt', 6, 50000, 'Hypothetical asteroid belt around Saturn');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', true, 13700, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearby spiral galaxy', false, 10000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy', false, 12000, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Beautiful spiral galaxy', false, 11000, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Bright bulge', false, 9000, 'Elliptical');
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 'Nearby spiral', false, 12000, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3475, false, true, 'Earth''s moon');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, false, true, 'Mars moon');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, false, true, 'Mars moon');
INSERT INTO public.moon VALUES (4, 'Europa', 5, 3122, false, true, 'Jupiter moon with water');
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, 5268, false, true, 'Largest moon');
INSERT INTO public.moon VALUES (6, 'Callisto', 5, 4820, false, true, 'Jupiter moon');
INSERT INTO public.moon VALUES (7, 'Io', 5, 3643, false, true, 'Volcanically active moon');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, false, true, 'Saturn moon with atmosphere');
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 1528, false, true, 'Saturn moon');
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 1469, false, true, 'Saturn moon');
INSERT INTO public.moon VALUES (11, 'Proxima b Moon1', 7, 3000, false, true, 'Moon of Proxima b');
INSERT INTO public.moon VALUES (12, 'Proxima b Moon2', 7, 3200, false, true, 'Moon of Proxima b');
INSERT INTO public.moon VALUES (13, 'Sirius b1 Moon1', 8, 2800, false, true, 'Moon of Sirius b1');
INSERT INTO public.moon VALUES (14, 'Alpha Centauri Bb Moon1', 9, 2900, false, true, 'Moon of Alpha Centauri Bb');
INSERT INTO public.moon VALUES (15, 'Betelgeuse Planet1 Moon1', 10, 5000, false, true, 'Gas giant moon');
INSERT INTO public.moon VALUES (16, 'Betelgeuse Planet1 Moon2', 10, 5100, false, true, 'Gas giant moon');
INSERT INTO public.moon VALUES (17, 'Rigel Planet1 Moon1', 11, 6000, false, true, 'Hot planet moon');
INSERT INTO public.moon VALUES (18, 'Rigel Planet1 Moon2', 11, 6100, false, true, 'Hot planet moon');
INSERT INTO public.moon VALUES (19, 'Rigel Planet2 Moon1', 12, 6200, false, true, 'Cold planet moon');
INSERT INTO public.moon VALUES (20, 'Rigel Planet2 Moon2', 12, 6300, false, true, 'Cold planet moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.055, 4879, false, 'Closest planet to Sun');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.815, 12104, false, 'Hot and toxic atmosphere');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 12742, true, 'Our planet');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.107, 6779, false, 'Red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 317.8, 139820, false, 'Gas giant');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 95.2, 116460, false, 'Ringed planet');
INSERT INTO public.planet VALUES (7, 'Proxima b', 2, 1.3, 11000, false, 'Exoplanet near Proxima Centauri');
INSERT INTO public.planet VALUES (8, 'Sirius b1', 3, 0.9, 12000, false, 'Hypothetical planet');
INSERT INTO public.planet VALUES (9, 'Alpha Centauri Bb', 4, 1.1, 13000, false, 'Exoplanet candidate');
INSERT INTO public.planet VALUES (10, 'Betelgeuse Planet1', 5, 5, 15000, false, 'Gas planet');
INSERT INTO public.planet VALUES (11, 'Rigel Planet1', 6, 10, 20000, false, 'Hot planet');
INSERT INTO public.planet VALUES (12, 'Rigel Planet2', 6, 12, 22000, false, 'Cold planet');
INSERT INTO public.planet VALUES (13, 'Vega Planet1', 7, 3, 15000, false, 'Exoplanet');
INSERT INTO public.planet VALUES (14, 'Polaris Planet1', 8, 4, 16000, false, 'Exoplanet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, true, 'Our star');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 0.12, true, 'Red dwarf near Sun');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 2.1, false, 'Brightest star in night sky');
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 1.1, false, 'Binary system component');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 2, 20, true, 'Red supergiant');
INSERT INTO public.star VALUES (6, 'Rigel', 2, 18, false, 'Blue supergiant');
INSERT INTO public.star VALUES (7, 'Vega', 3, 2.1, false, 'Bright star in Lyra');
INSERT INTO public.star VALUES (8, 'Polaris', 4, 5.4, true, 'North Star');


--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_belt_asteroid_belt_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: asteroid_belt asteroid_belt_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_name_key UNIQUE (name);


--
-- Name: asteroid_belt asteroid_belt_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_pkey PRIMARY KEY (asteroid_belt_id);


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
-- Name: asteroid_belt asteroid_belt_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

