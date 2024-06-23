import express from 'express'

const orderController = require('../controllers/orderController')

const orderRouter = express.Router()

// Define the routes
orderRouter.get('/createOrder', orderController.createOrder)
orderRouter.get('/getOrderById', orderController.getOrderById)
orderRouter.put('/updateOrderStatus', orderController.updateOrderStatus)
orderRouter.delete('/deleteOrder', orderController.deleteOrder)

export default orderRouter