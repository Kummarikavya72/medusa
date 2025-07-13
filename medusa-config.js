const dotenv = require("dotenv");
dotenv.config();

module.exports = {
  projectConfig: {
    redis_url: process.env.REDIS_URL,
    database_url: process.env.DATABASE_URL,
    database_type: "postgres",
    jwt_secret: process.env.JWT_SECRET,
    cookie_secret: process.env.COOKIE_SECRET,
    store_cors: "http://localhost:8000,http://localhost:3000",
    admin_cors: "http://localhost:7000,http://localhost:3000",
  },
  plugins: [],
};
