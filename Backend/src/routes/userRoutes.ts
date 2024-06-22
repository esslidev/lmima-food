import express from 'express'

const userController = require('../controllers/userController')

const userRouter = express.Router()

// Define the routes
userRouter.get('/getUserById', userController.getUserById)
userRouter.get('/getUsers', userController.getUsers)
userRouter.put('/updateUser', userController.updateUser)
userRouter.delete('/deleteUser', userController.deleteUser)

userRouter.get('/getUserOrders', userController.getUserOrders)
userRouter.get('/getUserWishlist', userController.getUserWishlist)
userRouter.get('/getUserCart', userController.getUserCart)

export default userRouter
