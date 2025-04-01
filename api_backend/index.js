const express = require("express");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const authRouter = require("./routes/auth");
const bannerRouter = require('./routes/banner')
const categoryRouter = require('./routes/category')
const subCategoryRouter = require("./routes/sub_category")
const productRouter = require('./routes/product')
const productReviewRouter = require('./routes/product_review')

const cors = require("cors");
const dotenv = require("dotenv");


dotenv.config();

const app = express();
const port = 3000;
const db = process.env.MONGO_DB_URI;
app.use(
  cors({
    origin: "*", // Allow all origins (not recommended for production)
    methods: ["GET", "POST", "PUT", "DELETE"], // Allowed methods
    allowedHeaders: ["Content-Type", "Authorization"], // Allowed headers
  })
);  
app.use(express.json());
app.use(authRouter);
app.use(bannerRouter)
app.use(categoryRouter)
app.use(subCategoryRouter)
app.use(productRouter)
app.use(productReviewRouter)
app.use(bodyParser.urlencoded({ extended: true }));

mongoose
  .connect(db)
  .then(() => console.log("Connected to MongoDB"))
  .catch((err) => console.log(err));
app.listen(port, () => console.log(`Server is running on port ${port}`));
