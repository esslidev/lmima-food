import express from 'express'

const authController = require('../controllers/authController')

const authRouter = express.Router()

// Define the routes
authRouter.post('/renewAccess', authController.renewAccess)
authRouter.post('/signUp', authController.signUp)
authRouter.post('/sellerSignUp', authController.signUp)
authRouter.post('/signIn', authController.signIn)
authRouter.post('/sellerSignIn', authController.signIn)

export default authRouter