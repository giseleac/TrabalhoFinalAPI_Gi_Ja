const knex = require("knex");

const conn = knex({
    client: "mysql2",
    connection: {
        host: "localhost",
        user: "root",
        password: "",
        database: "biblioteca_GIJA"
    }
});

module.exports = conn;