const sqlite3 = require("sqlite3").verbose();
const db = new sqlite3.Database("./universe.db");

db.serialize(() => {
  console.log("🌌 GALAXIES");
  db.each("SELECT * FROM galaxy", (err, row) => {
    if (err) throw err;
    console.log(row);
  });

  console.log("\n⭐ STARS");
  db.each("SELECT * FROM star", (err, row) => {
    if (err) throw err;
    console.log(row);
  });

  console.log("\n🪐 PLANETS");
  db.each("SELECT * FROM planet", (err, row) => {
    if (err) throw err;
    console.log(row);
  });

  console.log("\n🌙 MOONS");
  db.each("SELECT * FROM moon", (err, row) => {
    if (err) throw err;
    console.log(row);
  });
});

db.close();
