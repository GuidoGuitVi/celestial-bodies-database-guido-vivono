const sqlite3 = require("sqlite3").verbose();
const fs = require("fs");

const dbFile = "./universe.db";
const dumpFile = "./universe.sql";

const db = new sqlite3.Database(dbFile);

db.serialize(() => {
  db.all("SELECT sql FROM sqlite_master WHERE type='table'", (err, rows) => {
    if (err) throw err;

    const sqlStatements = rows.map((r) => r.sql + ";").join("\n\n");
    fs.writeFileSync(dumpFile, sqlStatements);

    console.log(`✅ Dump generado en ${dumpFile}`);
  });
});

db.close();
