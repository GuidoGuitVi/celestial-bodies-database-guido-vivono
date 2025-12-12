const sqlite3 = require("sqlite3").verbose();
const db = new sqlite3.Database("./universe.db");

// Crear tablas
db.serialize(() => {
  // GALAXY
  db.run(`CREATE TABLE IF NOT EXISTS galaxy (
    galaxy_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR UNIQUE NOT NULL,
    type VARCHAR,
    age_in_millions NUMERIC,
    has_life BOOLEAN NOT NULL,
    description TEXT
  )`);

  // STAR
  db.run(`CREATE TABLE IF NOT EXISTS star (
    star_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR UNIQUE NOT NULL,
    galaxy_id INTEGER NOT NULL,
    type VARCHAR,
    age_in_millions NUMERIC,
    is_supernova BOOLEAN NOT NULL,
    description TEXT,
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
  )`);

  // PLANET
  db.run(`CREATE TABLE IF NOT EXISTS planet (
    planet_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR UNIQUE NOT NULL,
    star_id INTEGER NOT NULL,
    type VARCHAR,
    radius INT,
    distance_from_star NUMERIC,
    has_life BOOLEAN NOT NULL,
    description TEXT,
    FOREIGN KEY (star_id) REFERENCES star(star_id)
  )`);

  // MOON
  db.run(`CREATE TABLE IF NOT EXISTS moon (
    moon_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR UNIQUE NOT NULL,
    planet_id INTEGER NOT NULL,
    radius INT,
    distance_from_planet NUMERIC,
    is_spherical BOOLEAN NOT NULL,
    description TEXT,
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
  )`);

  console.log("✅ Tablas creadas correctamente");
});

db.close();
