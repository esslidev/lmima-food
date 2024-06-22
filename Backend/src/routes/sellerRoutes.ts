import express from 'express'

const sellerController = require('../controllers/sellerController')

const sellerRouter = express.Router()

// Define the routes
sellerRouter.get('/getSellerById', sellerController.getSellerById)
sellerRouter.get('/getSellers', sellerController.getSellers)
sellerRouter.put('/updateSeller', sellerController.updateSeller)
sellerRouter.delete('/deleteSeller', sellerController.deleteSeller)

sellerRouter.get('/getSellerMenu', sellerController.getSellerMenu)

export default sellerRouter