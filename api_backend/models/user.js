const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  fullName: {
    type: String,
    required: [true, "Full name is required"],
    trim: true,
  },
  email: {
    type: String,
    required: [true, "Email is required"],
    trim: true,
    validate: {
      validator: (value) => {
        const result =
          /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return result.test(value);
      },
      message: "Email is invalid",
    },
  },
  state: {
    type: String,
    default: "",
  },
  city: {
    type: String,
    default: "",
  },
  locality: {
    type: String,
    default: "",
  },
  password: {
    type: String,
    required: [true, "Password is required"],
    validate: {
      validator: (value) => {
        return value.length >= 8;
      },
      message: "Password is invalid. 8 characters minimum",
    },
  },
});

const User = mongoose.model("User", userSchema);
module.exports = User;
