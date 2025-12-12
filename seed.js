const sqlite3 = require("sqlite3").verbose();
const db = new sqlite3.Database("./universe.db");

db.serialize(() => {
  // GALAXIES (6)
  const galaxies = [
    ["Milky Way", "Spiral", 13600, true, "Our home galaxy"],
    ["Andromeda", "Spiral", 10000, false, "Neighbor galaxy"],
    ["Triangulum", "Spiral", 12000, false, ""],
    ["Whirlpool", "Spiral", 16000, false, ""],
    ["Sombrero", "Elliptical", 9000, false, ""],
    ["Pinwheel", "Spiral", 13000, false, ""],
  ];
  const stmtG = db.prepare(
    "INSERT OR IGNORE INTO galaxy (name,type,age_in_millions,has_life,description) VALUES (?,?,?,?,?)",
  );
  galaxies.forEach((g) => stmtG.run(...g));
  stmtG.finalize();

  // STARS (6)
  const stars = [
    ["Sun", 1, "G-type", 4600, false, "Our star"],
    ["Alpha Centauri A", 2, "G-type", 5000, false, ""],
    ["Sirius", 3, "A-type", 242, false, ""],
    ["Betelgeuse", 4, "M-type", 10000, false, ""],
    ["Vega", 5, "A-type", 455, false, ""],
    ["Rigel", 6, "B-type", 800, false, ""],
  ];
  const stmtS = db.prepare(
    "INSERT OR IGNORE INTO star (name,galaxy_id,type,age_in_millions,is_supernova,description) VALUES (?,?,?,?,?,?)",
  );
  stars.forEach((s) => stmtS.run(...s));
  stmtS.finalize();

  // PLANETS (12)
  const planets = [
    ["Mercury", 1, "Terrestrial", 2439.7, 57.9, false, ""],
    ["Venus", 1, "Terrestrial", 6051.8, 108.2, false, ""],
    ["Earth", 1, "Terrestrial", 6371, 149.6, true, "Our planet"],
    ["Mars", 1, "Terrestrial", 3389.5, 227.9, false, ""],
    ["Jupiter", 1, "Gas Giant", 69911, 778.5, false, ""],
    ["Saturn", 1, "Gas Giant", 58232, 1433.5, false, ""],
    ["Uranus", 1, "Ice Giant", 25362, 2872.5, false, ""],
    ["Neptune", 1, "Ice Giant", 24622, 4495.1, false, ""],
    ["Kepler-22b", 2, "Super Earth", 12300, 600, false, ""],
    ["Proxima b", 2, "Terrestrial", 7000, 0.05, false, ""],
    ["TRAPPIST-1d", 3, "Terrestrial", 12000, 0.02, false, ""],
    ["Gliese 667 Cc", 3, "Super Earth", 13000, 0.03, false, ""],
  ];
  const stmtP = db.prepare(
    "INSERT OR IGNORE INTO planet (name,star_id,type,radius,distance_from_star,has_life,description) VALUES (?,?,?,?,?,?,?)",
  );
  planets.forEach((p) => stmtP.run(...p));
  stmtP.finalize();

  // MOONS (20)
  const moons = [
    ["Moon", 3, 1737.1, 0.384, true, "Earth's moon"],
    ["Phobos", 4, 11.3, 0.009, true, "Mars moon"],
    ["Deimos", 4, 6.2, 0.023, true, "Mars moon"],
    ["Europa", 5, 1560.8, 0.671, true, "Jupiter moon"],
    ["Ganymede", 5, 2634.1, 1.07, true, "Jupiter moon"],
    ["Callisto", 5, 2410.3, 1.883, true, "Jupiter moon"],
    ["Io", 5, 1821.6, 0.421, true, "Jupiter moon"],
    ["Titan", 6, 2575.5, 1.222, true, "Saturn moon"],
    ["Enceladus", 6, 252.1, 0.238, true, "Saturn moon"],
    ["Triton", 8, 1353.4, 0.355, true, "Neptune moon"],
    ["Oberon", 7, 761.4, 0.584, true, "Uranus moon"],
    ["Titania", 7, 788.9, 0.436, true, "Uranus moon"],
    ["Miranda", 7, 235.8, 0.13, true, "Uranus moon"],
    ["Io-2", 9, 3000, 0.5, true, "Exoplanet moon"],
    ["Europa-2", 9, 1500, 0.3, true, "Exoplanet moon"],
    ["Moon-1", 10, 1000, 0.1, true, "Proxima b moon"],
    ["Moon-2", 10, 800, 0.15, true, "Proxima b moon"],
    ["Moon-3", 11, 1200, 0.2, true, "TRAPPIST-1d moon"],
    ["Moon-4", 11, 1400, 0.25, true, "TRAPPIST-1d moon"],
    ["Moon-5", 12, 1100, 0.3, true, "Gliese 667 Cc moon"],
  ];
  const stmtM = db.prepare(
    "INSERT OR IGNORE INTO moon (name,planet_id,radius,distance_from_planet,is_spherical,description) VALUES (?,?,?,?,?,?)",
  );
  moons.forEach((m) => stmtM.run(...m));
  stmtM.finalize();

  console.log("✅ Datos insertados correctamente");
});

db.close();
