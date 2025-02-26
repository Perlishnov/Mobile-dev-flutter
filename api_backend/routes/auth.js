const express = require("express");
const User = require("../models/user");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
//Crear el enroutador
const authRouter = express.Router();

//Crear un usuario

authRouter.post("/api/signup", async (req, res) => {
  try {
    //Obtener los campos necesarios para crear un usuario
    const { fullName, email, password } = req.body;
    //Verificar si el usuario ya existe en el bd
    const existingEmail = await User.findOne({
      email,
    });
    if (existingEmail) {
      return res.status(400).send({msg:"El email ya esta registrado"});
    } else {
      const salt = await bcrypt.genSalt();
      const passwordHash = await bcrypt.hash(password, salt);
      let user = new User({
        fullName,
        email,
        password: passwordHash,
      });
      await user.save();
      res.json(user);
    }
  } catch (err) {
    res.status(500).json({ err: err.message });
    console.log(err);
  }
});

authRouter.post("/api/login", async (req, res) => {

    try {
      const { email, password } = req.body;
      const user = await User.findOne({ email });
      if (!user) {
        return res.status(400).send("El email no esta registrado");
      } else {
        const isMatch = await bcrypt.compare(password, user.password);
        if (isMatch) {
          const token = jwt.sign({ id: user._id }, "SUPERSECRETKEY", { expiresIn: "1h" });
          const { password, ...userWithoutPassword } = user._doc;
          //Devolver el usuario sin la password
          return res.json({ user: userWithoutPassword, token });
        } else {
          return res.status(400).send("La contraseña es incorrecta");
        }
      }
    } catch (err) {
      res.status(500).json({ err: err.message });
      console.log(err);
    }
});

module.exports = authRouter;
