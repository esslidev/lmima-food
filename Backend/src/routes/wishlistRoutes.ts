import express from 'express'

const wishlistController = require('../controllers/wishlistController')

const wishlistRouter = express.Router()

// Define the routes
wishlistRouter.get('/createWishlist', wishlistController.createWishlist)
wishlistRouter.get('/getWishlistById', wishlistController.getWishlistById)
wishlistRouter.post('/addItemToWishlist', wishlistController.addItemToWishlist)
wishlistRouter.delete('/removeItemFromWishlist', wishlistController.removeItemFromWishlist)
wishlistRouter.delete('/clearWishlist', wishlistController.clearWishlist)
export default wishlistRouter