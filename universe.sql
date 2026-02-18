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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    description text,
    diameter_km integer,
    has_water boolean,
    is_spherical boolean,
    distance_from_earth numeric,
    orbital_period_years integer,
    rotation_period_hours integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    galaxy_types character varying(50),
    age_in_millions_of_years numeric,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric,
    number_of_stars integer,
    spiral_arms integer
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    age_in_millions_of_years numeric,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric,
    orbital_period_days integer,
    diameter_km integer
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    description text,
    planet_types character varying(50),
    age_in_millions_of_years numeric,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric,
    number_of_moons integer,
    diameter_km integer
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years numeric,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric,
    surface_temperature integer,
    number_of_planets integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 4, 'Maior asteroide do cinturão', 940, true, true, 0.0004, 5, 9);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 4, 'Segundo maior asteroide', 525, false, false, 0.0004, 4, 5);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 4, 'Terceiro maior asteroide', 512, false, false, 0.0004, 5, 8);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 4, 'Quarto maior asteroide', 434, false, true, 0.0005, 6, 27);
INSERT INTO public.asteroid VALUES (5, 'Ida', 4, 'Asteroide com lua própria', 31, false, false, 0.0006, 5, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Nossa galáxia', 'Spiral', 13600, true, true, 0, 100000, 4);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Galáxia mais próxima', 'Spiral', 10000, false, true, 2.5, 1000000, 2);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Terceira maior do Grupo Local', 'Spiral', 9500, false, true, 3, 40000, 3);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Galáxia interativa', 'Spiral', 400, false, true, 23, 100000, 2);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Galáxia com núcleo brilhante', 'Spiral', 9000, false, true, 29.3, 80000, 1);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Galáxia em formato de cata-vento', 'Spiral', 8500, false, true, 21, 100000, 4);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Lua', 3, 'Satélite natural da Terra', 4500, false, true, 0.0000026, 27, 3474);
INSERT INTO public.moon VALUES (2, 'Fobos', 4, 'Maior lua de Marte', 4500, false, false, 0.000005, 1, 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Menor lua de Marte', 4500, false, false, 0.000005, 1, 12);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Lua vulcânica de Júpiter', 4500, false, true, 0.00009, 2, 3643);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Lua gelada com oceano subterrâneo', 4500, false, true, 0.00009, 4, 3121);
INSERT INTO public.moon VALUES (6, 'Ganimedes', 5, 'Maior lua do sistema solar', 4500, false, true, 0.00009, 7, 5268);
INSERT INTO public.moon VALUES (7, 'Calisto', 5, 'Lua cheia de crateras', 4500, false, true, 0.00009, 17, 4821);
INSERT INTO public.moon VALUES (8, 'Titã', 6, 'Lua com atmosfera espessa', 4500, false, true, 0.00014, 16, 5150);
INSERT INTO public.moon VALUES (9, 'Reia', 6, 'Segunda maior lua de Saturno', 4500, false, true, 0.00014, 5, 1527);
INSERT INTO public.moon VALUES (10, 'Dione', 6, 'Lua rica em gelo', 4500, false, true, 0.00014, 3, 1123);
INSERT INTO public.moon VALUES (11, 'Tétis', 6, 'Lua gelada', 4500, false, true, 0.00014, 2, 1062);
INSERT INTO public.moon VALUES (12, 'Encélado', 6, 'Lua com gêiseres de água', 4500, false, true, 0.00014, 1, 504);
INSERT INTO public.moon VALUES (13, 'Mimas', 6, 'Parece a Estrela da Morte', 4500, false, true, 0.00014, 1, 396);
INSERT INTO public.moon VALUES (14, 'Titânia', 7, 'Maior lua de Urano', 4500, false, true, 0.00029, 9, 1578);
INSERT INTO public.moon VALUES (15, 'Oberon', 7, 'Segunda maior lua de Urano', 4500, false, true, 0.00029, 13, 1523);
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, 'Lua escura de Urano', 4500, false, true, 0.00029, 4, 1169);
INSERT INTO public.moon VALUES (17, 'Ariel', 7, 'Lua mais brilhante de Urano', 4500, false, true, 0.00029, 3, 1158);
INSERT INTO public.moon VALUES (18, 'Tritão', 8, 'Maior lua de Netuno', 4500, false, true, 0.00047, 6, 2707);
INSERT INTO public.moon VALUES (19, 'Nereida', 8, 'Terceira maior lua de Netuno', 4500, false, true, 0.00047, 360, 340);
INSERT INTO public.moon VALUES (20, 'Proteu', 8, 'Segunda maior lua de Netuno', 4500, false, true, 0.00047, 1, 420);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Planeta mais próximo do Sol', 'Terrestrial', 4500, false, true, 0.000006, 0, 4879);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Planeta mais quente', 'Terrestrial', 4500, false, true, 0.0000027, 0, 12104);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Nosso planeta', 'Terrestrial', 4500, true, true, 0, 1, 12742);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Planeta vermelho', 'Terrestrial', 4500, false, true, 0.000005, 2, 6779);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Maior planeta do sistema solar', 'Gas Giant', 4500, false, true, 0.00009, 79, 139820);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Planeta com anéis', 'Gas Giant', 4500, false, true, 0.00014, 82, 116460);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Gigante de gelo', 'Ice Giant', 4500, false, true, 0.00029, 27, 50724);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Planeta mais ventoso', 'Ice Giant', 4500, false, true, 0.00047, 14, 49244);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 'Exoplaneta na zona habitável', 'Terrestrial', 4850, false, true, 4.24, 0, 11000);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 2, 'Super-Terra fria', 'Super-earth', 4850, false, true, 4.24, 0, 14000);
INSERT INTO public.planet VALUES (11, 'Sirius b', 4, 'Anã branca', 'White Dwarf', 300, false, true, 8.6, 0, 11700);
INSERT INTO public.planet VALUES (12, 'Vega b', 6, 'Exoplaneta quente', 'Gas Giant', 455, false, true, 25, 0, 150000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Nossa estrela', 4600, true, true, 0.0000158, 5778, 8);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Estrela mais próxima do Sol', 4850, false, true, 4.24, 3042, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Supergigante vermelha', 8, false, true, 642.5, 3500, 0);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 'Estrela mais brilhante do céu noturno', 300, false, true, 8.6, 9940, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 'Sistema estelar triplo', 4850, false, true, 4.37, 5790, 0);
INSERT INTO public.star VALUES (6, 'Vega', 1, 'Estrela brilhante na constelação de Lyra', 455, false, true, 25, 9602, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


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
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

