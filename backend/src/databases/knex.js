const db = require("knex")({
    client: "mysql",
    connection: {
      port: 3306,
      host: "localhost",
      user: "root",
      password: "",
      database: "blog_web"
    }
  });