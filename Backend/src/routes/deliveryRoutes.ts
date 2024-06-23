import express from 'express'

const deliveryController = require('../controllers/deliveryController')

const deliveryRouter = express.Router()

// Define the routes
deliveryRouter.post('/createDelivery', deliveryController.createDelivery)
deliveryRouter.get('/getDelivery', deliveryController.getDelivery)
deliveryRouter.put('/updateDeliveryStatus', deliveryController.updateDeliveryStatus)
deliveryRouter.delete('/deleteDelivery', deliveryController.deleteDelivery)

deliveryRouter.get('/getDeliveries', deliveryController.getDeliveries)

export default deliveryRouter