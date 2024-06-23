import express from 'express'

const cartController = require('../controllers/cartController')

const cartRouter = express.Router()

// Define the routes
cartRouter.get('/createCart', cartController.createCart)
cartRouter.get('/getCartById', cartController.getCartById)
cartRouter.post('/addItemToCart', cartController.addItemToCart)
cartRouter.delete('/removeItemFromCart', cartController.removeItemFromCart)
cartRouter.delete('/clearCart', cartController.clearCart)
export default cartRouter