import express from 'express'

const menuController = require('../controllers/menuController')

const menuRouter = express.Router()

// Define the routes
menuRouter.post('/createMenu', menuController.createMenu)
menuRouter.get('/getMenu', menuController.getMenu)
menuRouter.delete('/deleteMenu', menuController.deleteMenu)

export default menuRouter