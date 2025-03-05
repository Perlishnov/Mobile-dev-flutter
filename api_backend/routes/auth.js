const express = require('express')
const User = require('../models/user')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')


const authRouter = express.Router()

authRouter.post('/api/signup', async (req, res) => {
    try {
        const { fullName, email, password } = req.body
        const existingEmail = await User.findOne({ email })
        if (existingEmail) {
            return res.status(400).json({ msg: "Email already exist" })
        } else {
            //generate a salt with a cost factor of 10
            const salt = await bcrypt.genSalt()
            //hash de password using de generated salt
            const hashedPassword = await bcrypt.hash(password, salt)
            let user = new User({ fullName, email, password: hashedPassword })
            user = await user.save()
            res.json({ user })
        }

    } catch (error) {
        res.status(500).json({ error: error.message })
        console.log(error)
    }
})


authRouter.post('/api/signin', async (req, res)=>{
    try {
        //get email and password from iterface
        const {email, password} = req.body
        //find if there is an existing user with provided email
        const findUser = await User.findOne({email})
        if (!findUser) {
            return res.status(400).json({msg: "Email not found"})
        } else {
            //check if password match with provided email
            const isMatch = await bcrypt.compare(password, findUser.password)
            if (!isMatch) {
                return res.status(400).json({msg: "Incorrect Password"})
            } else {
                //login de user
                const token = jwt.sign({id: findUser._id}, "passwordKey")

                //extract de password because we don't want to send it back to user
                const { password, ...userWithoutPassword } = findUser._doc

                //send the response back
                res.json({token, ...userWithoutPassword})

            }
        }
    } catch (error) {
        res.status(500).json({ error: error.message })
    }
})

module.exports = authRouter