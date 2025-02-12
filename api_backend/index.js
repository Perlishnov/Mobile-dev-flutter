const express = require("express");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const authRouter = require("./routes/auth");
const cors = require("cors");

const app = express();
const port = 3000;
const db =
  "mongodb+srv://1114584:sF7x46joh1eBVV2f@cluster0.3u13f.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

app.use(
  cors({
    origin: "*", // Allow all origins (not recommended for production)
    methods: ["GET", "POST", "PUT", "DELETE"], // Allowed methods
    allowedHeaders: ["Content-Type", "Authorization"], // Allowed headers
  })
);  
app.use(express.json());
app.use(authRouter);

mongoose
  .connect(db)
  .then(() => console.log("Connected to MongoDB"))
  .catch((err) => console.log(err));
app.listen(port, () => console.log(`Server is running on port ${port}`));
