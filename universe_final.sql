PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE asteroid_belt (
    belt_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    number_of_asteroids INT,
    mass_in_kg NUMERIC,
    near_planet BOOLEAN NOT NULL
);
INSERT INTO asteroid_belt VALUES(NULL,'Main Belt',1000000,3.0e+21,1);
INSERT INTO asteroid_belt VALUES(NULL,'Kuiper Belt',1000000,1.5e+22,1);
INSERT INTO asteroid_belt VALUES(NULL,'Asteroid Belt X',500000,2.0e+21,0);
CREATE TABLE galaxy (
    galaxy_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    has_life BOOLEAN,
    age_in_millions INT
);
INSERT INTO galaxy VALUES(1,'Milky Way','Our home galaxy',1,13700);
INSERT INTO galaxy VALUES(2,'Andromeda','Neighbor galaxy',0,10000);
INSERT INTO galaxy VALUES(3,'Triangulum','Small spiral galaxy',0,12000);
INSERT INTO galaxy VALUES(4,'Whirlpool','Beautiful spiral galaxy',0,11000);
INSERT INTO galaxy VALUES(5,'Sombrero','Bright bulge',0,9000);
INSERT INTO galaxy VALUES(6,'Messier 81','Nearby spiral',0,12000);
CREATE TABLE star (
    star_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INTEGER NOT NULL,
    mass_solar NUMERIC,
    is_supernova BOOLEAN,
    description TEXT,
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);
INSERT INTO star VALUES(1,'Sun',1,1,0,'Our star');
INSERT INTO star VALUES(2,'Proxima Centauri',1,0.119999999999999995,0,'Red dwarf near Sun');
INSERT INTO star VALUES(3,'Sirius',1,2.10000000000000008,0,'Brightest star in night sky');
INSERT INTO star VALUES(4,'Alpha Centauri A',1,1.10000000000000008,0,'Binary system component');
INSERT INTO star VALUES(5,'Betelgeuse',2,20,1,'Red supergiant');
INSERT INTO star VALUES(6,'Rigel',2,18,0,'Blue supergiant');
CREATE TABLE planet (
    planet_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INTEGER NOT NULL,
    mass_in_earths NUMERIC,
    diameter_km INT,
    is_habitable BOOLEAN,
    description TEXT,
    FOREIGN KEY (star_id) REFERENCES star(star_id)
);
INSERT INTO planet VALUES(1,'Mercury',1,0.0550000000000000002,4879,0,'Closest planet to Sun');
INSERT INTO planet VALUES(2,'Venus',1,0.814999999999999946,12104,0,'Hot and toxic atmosphere');
INSERT INTO planet VALUES(3,'Earth',1,1,12742,1,'Our planet');
INSERT INTO planet VALUES(4,'Mars',1,0.106999999999999997,6779,0,'Red planet');
INSERT INTO planet VALUES(5,'Jupiter',1,317.800000000000011,139820,0,'Gas giant');
INSERT INTO planet VALUES(6,'Saturn',1,95.2000000000000028,116460,0,'Ringed planet');
INSERT INTO planet VALUES(7,'Proxima b',2,1.30000000000000004,11000,0,'Exoplanet near Proxima Centauri');
INSERT INTO planet VALUES(8,'Sirius b1',3,0.900000000000000022,12000,0,'Hypothetical planet');
INSERT INTO planet VALUES(9,'Alpha Centauri Bb',4,1.10000000000000008,13000,0,'Exoplanet candidate');
INSERT INTO planet VALUES(10,'Betelgeuse Planet1',5,5,15000,0,'Gas planet');
INSERT INTO planet VALUES(11,'Rigel Planet1',6,10,20000,0,'Hot planet');
INSERT INTO planet VALUES(12,'Rigel Planet2',6,12,22000,0,'Cold planet');
CREATE TABLE moon (
    moon_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INTEGER NOT NULL,
    diameter_km INT,
    is_habitable BOOLEAN,
    has_water BOOLEAN,
    description TEXT,
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);
INSERT INTO moon VALUES(1,'Moon',3,3475,0,0,'Earth''s moon');
INSERT INTO moon VALUES(2,'Phobos',4,22,0,0,'Mars moon');
INSERT INTO moon VALUES(3,'Deimos',4,12,0,0,'Mars moon');
INSERT INTO moon VALUES(4,'Europa',5,3122,0,1,'Jupiter moon with water');
INSERT INTO moon VALUES(5,'Ganymede',5,5268,0,1,'Largest moon');
INSERT INTO moon VALUES(6,'Callisto',5,4820,0,1,'Jupiter moon');
INSERT INTO moon VALUES(7,'Io',5,3643,0,0,'Volcanically active moon');
INSERT INTO moon VALUES(8,'Titan',6,5150,0,1,'Saturn moon with atmosphere');
INSERT INTO moon VALUES(9,'Rhea',6,1528,0,0,'Saturn moon');
INSERT INTO moon VALUES(10,'Iapetus',6,1469,0,0,'Saturn moon');
INSERT INTO moon VALUES(11,'Proxima b Moon1',7,3000,0,0,'Moon of Proxima b');
INSERT INTO moon VALUES(12,'Proxima b Moon2',7,3200,0,0,'Moon of Proxima b');
INSERT INTO moon VALUES(13,'Sirius b1 Moon1',8,2800,0,0,'Moon of Sirius b1');
INSERT INTO moon VALUES(14,'Alpha Centauri Bb Moon1',9,2900,0,0,'Moon of Alpha Centauri Bb');
INSERT INTO moon VALUES(15,'Betelgeuse Planet1 Moon1',10,5000,0,0,'Gas giant moon');
INSERT INTO moon VALUES(16,'Betelgeuse Planet1 Moon2',10,5100,0,0,'Gas giant moon');
INSERT INTO moon VALUES(17,'Rigel Planet1 Moon1',11,6000,0,0,'Hot planet moon');
INSERT INTO moon VALUES(18,'Rigel Planet1 Moon2',11,6100,0,0,'Hot planet moon');
INSERT INTO moon VALUES(19,'Rigel Planet2 Moon1',12,6200,0,0,'Cold planet moon');
INSERT INTO moon VALUES(20,'Rigel Planet2 Moon2',12,6300,0,0,'Cold planet moon');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('galaxy',6);
INSERT INTO sqlite_sequence VALUES('star',6);
INSERT INTO sqlite_sequence VALUES('planet',12);
INSERT INTO sqlite_sequence VALUES('moon',20);
COMMIT;
