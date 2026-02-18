psql --username=freecodecamp --dbname=postgres

CREATE DATABASE universe;

\c universe

-- Criar as 5 tabelas com colunas INT que não são PK ou FK
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    galaxy_types VARCHAR(50),
    age_in_millions_of_years NUMERIC,
    has_life BOOLEAN,
    is_spherical BOOLEAN,
    distance_from_earth NUMERIC,
    number_of_stars INT,  -- INT column (not PK or FK)
    spiral_arms INT        -- INT column (not PK or FK)
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL,
    description TEXT,
    age_in_millions_of_years NUMERIC,
    has_life BOOLEAN,
    is_spherical BOOLEAN,
    distance_from_earth NUMERIC,
    surface_temperature INT,  -- INT column (not PK or FK)
    number_of_planets INT,    -- INT column (not PK or FK)
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    star_id INT NOT NULL,
    description TEXT,
    planet_types VARCHAR(50),
    age_in_millions_of_years NUMERIC,
    has_life BOOLEAN,
    is_spherical BOOLEAN,
    distance_from_earth NUMERIC,
    number_of_moons INT,      -- INT column (not PK or FK)
    diameter_km INT,           -- INT column (not PK or FK)
    FOREIGN KEY (star_id) REFERENCES star(star_id)
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    planet_id INT NOT NULL,
    description TEXT,
    age_in_millions_of_years NUMERIC,
    has_life BOOLEAN,
    is_spherical BOOLEAN,
    distance_from_earth NUMERIC,
    orbital_period_days INT,   -- INT column (not PK or FK)
    diameter_km INT,            -- INT column (not PK or FK)
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);

CREATE TABLE asteroid (
    asteroid_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    planet_id INT,
    description TEXT,
    diameter_km INT,            -- INT column (not PK or FK)
    has_water BOOLEAN,
    is_spherical BOOLEAN,
    distance_from_earth NUMERIC,
    orbital_period_years INT,   -- INT column (not PK or FK)
    rotation_period_hours INT,  -- INT column (not PK or FK)
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);

-- Inserir galáxias (6)
INSERT INTO galaxy (name, description, galaxy_types, age_in_millions_of_years, has_life, is_spherical, distance_from_earth, number_of_stars, spiral_arms) VALUES
('Milky Way', 'Nossa galáxia', 'Spiral', 13600, TRUE, TRUE, 0, 100000, 4),
('Andromeda', 'Galáxia mais próxima', 'Spiral', 10000, FALSE, TRUE, 2.5, 1000000, 2),
('Triangulum', 'Terceira maior do Grupo Local', 'Spiral', 9500, FALSE, TRUE, 3, 40000, 3),
('Whirlpool', 'Galáxia interativa', 'Spiral', 400, FALSE, TRUE, 23, 100000, 2),
('Sombrero', 'Galáxia com núcleo brilhante', 'Spiral', 9000, FALSE, TRUE, 29.3, 80000, 1),
('Pinwheel', 'Galáxia em formato de cata-vento', 'Spiral', 8500, FALSE, TRUE, 21, 100000, 4);

-- Inserir estrelas (6)
INSERT INTO star (name, galaxy_id, description, age_in_millions_of_years, has_life, is_spherical, distance_from_earth, surface_temperature, number_of_planets) VALUES
('Sun', 1, 'Nossa estrela', 4600, TRUE, TRUE, 0.0000158, 5778, 8),
('Proxima Centauri', 1, 'Estrela mais próxima do Sol', 4850, FALSE, TRUE, 4.24, 3042, 2),
('Betelgeuse', 1, 'Supergigante vermelha', 8, FALSE, TRUE, 642.5, 3500, 0),
('Sirius', 1, 'Estrela mais brilhante do céu noturno', 300, FALSE, TRUE, 8.6, 9940, 1),
('Alpha Centauri A', 1, 'Sistema estelar triplo', 4850, FALSE, TRUE, 4.37, 5790, 0),
('Vega', 1, 'Estrela brilhante na constelação de Lyra', 455, FALSE, TRUE, 25, 9602, 1);

-- Inserir planetas (12)
INSERT INTO planet (name, star_id, description, planet_types, age_in_millions_of_years, has_life, is_spherical, distance_from_earth, number_of_moons, diameter_km) VALUES
('Mercury', 1, 'Planeta mais próximo do Sol', 'Terrestrial', 4500, FALSE, TRUE, 0.000006, 0, 4879),
('Venus', 1, 'Planeta mais quente', 'Terrestrial', 4500, FALSE, TRUE, 0.0000027, 0, 12104),
('Earth', 1, 'Nosso planeta', 'Terrestrial', 4500, TRUE, TRUE, 0, 1, 12742),
('Mars', 1, 'Planeta vermelho', 'Terrestrial', 4500, FALSE, TRUE, 0.000005, 2, 6779),
('Jupiter', 1, 'Maior planeta do sistema solar', 'Gas Giant', 4500, FALSE, TRUE, 0.00009, 79, 139820),
('Saturn', 1, 'Planeta com anéis', 'Gas Giant', 4500, FALSE, TRUE, 0.00014, 82, 116460),
('Uranus', 1, 'Gigante de gelo', 'Ice Giant', 4500, FALSE, TRUE, 0.00029, 27, 50724),
('Neptune', 1, 'Planeta mais ventoso', 'Ice Giant', 4500, FALSE, TRUE, 0.00047, 14, 49244),
('Proxima Centauri b', 2, 'Exoplaneta na zona habitável', 'Terrestrial', 4850, FALSE, TRUE, 4.24, 0, 11000),
('Proxima Centauri c', 2, 'Super-Terra fria', 'Super-earth', 4850, FALSE, TRUE, 4.24, 0, 14000),
('Sirius b', 4, 'Anã branca', 'White Dwarf', 300, FALSE, TRUE, 8.6, 0, 11700),
('Vega b', 6, 'Exoplaneta quente', 'Gas Giant', 455, FALSE, TRUE, 25, 0, 150000);

-- Inserir luas (20)
INSERT INTO moon (name, planet_id, description, age_in_millions_of_years, has_life, is_spherical, distance_from_earth, orbital_period_days, diameter_km) VALUES
('Lua', 3, 'Satélite natural da Terra', 4500, FALSE, TRUE, 0.0000026, 27, 3474),
('Fobos', 4, 'Maior lua de Marte', 4500, FALSE, FALSE, 0.000005, 1, 22),
('Deimos', 4, 'Menor lua de Marte', 4500, FALSE, FALSE, 0.000005, 1, 12),
('Io', 5, 'Lua vulcânica de Júpiter', 4500, FALSE, TRUE, 0.00009, 2, 3643),
('Europa', 5, 'Lua gelada com oceano subterrâneo', 4500, FALSE, TRUE, 0.00009, 4, 3121),
('Ganimedes', 5, 'Maior lua do sistema solar', 4500, FALSE, TRUE, 0.00009, 7, 5268),
('Calisto', 5, 'Lua cheia de crateras', 4500, FALSE, TRUE, 0.00009, 17, 4821),
('Titã', 6, 'Lua com atmosfera espessa', 4500, FALSE, TRUE, 0.00014, 16, 5150),
('Reia', 6, 'Segunda maior lua de Saturno', 4500, FALSE, TRUE, 0.00014, 5, 1527),
('Dione', 6, 'Lua rica em gelo', 4500, FALSE, TRUE, 0.00014, 3, 1123),
('Tétis', 6, 'Lua gelada', 4500, FALSE, TRUE, 0.00014, 2, 1062),
('Encélado', 6, 'Lua com gêiseres de água', 4500, FALSE, TRUE, 0.00014, 1, 504),
('Mimas', 6, 'Parece a Estrela da Morte', 4500, FALSE, TRUE, 0.00014, 1, 396),
('Titânia', 7, 'Maior lua de Urano', 4500, FALSE, TRUE, 0.00029, 9, 1578),
('Oberon', 7, 'Segunda maior lua de Urano', 4500, FALSE, TRUE, 0.00029, 13, 1523),
('Umbriel', 7, 'Lua escura de Urano', 4500, FALSE, TRUE, 0.00029, 4, 1169),
('Ariel', 7, 'Lua mais brilhante de Urano', 4500, FALSE, TRUE, 0.00029, 3, 1158),
('Tritão', 8, 'Maior lua de Netuno', 4500, FALSE, TRUE, 0.00047, 6, 2707),
('Nereida', 8, 'Terceira maior lua de Netuno', 4500, FALSE, TRUE, 0.00047, 360, 340),
('Proteu', 8, 'Segunda maior lua de Netuno', 4500, FALSE, TRUE, 0.00047, 1, 420);

-- Inserir asteroides (para a quinta tabela)
INSERT INTO asteroid (name, planet_id, description, diameter_km, has_water, is_spherical, distance_from_earth, orbital_period_years, rotation_period_hours) VALUES
('Ceres', 4, 'Maior asteroide do cinturão', 940, TRUE, TRUE, 0.0004, 5, 9),
('Vesta', 4, 'Segundo maior asteroide', 525, FALSE, FALSE, 0.0004, 4, 5),
('Pallas', 4, 'Terceiro maior asteroide', 512, FALSE, FALSE, 0.0004, 5, 8),
('Hygiea', 4, 'Quarto maior asteroide', 434, FALSE, TRUE, 0.0005, 6, 27),
('Ida', 4, 'Asteroide com lua própria', 31, FALSE, FALSE, 0.0006, 5, 5);

