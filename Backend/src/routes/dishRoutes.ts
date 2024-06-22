import express from 'express'

const dishController = require('../controllers/dishController')

const dishRouter = express.Router()

// Define the routes
dishRouter.post('/createDish', dishController.createDish)
dishRouter.get('/getDishById', dishController.getDishById)
dishRouter.put('/updateDish', dishController.updateDish)
dishRouter.delete('/deleteDish', dishController.deleteDish)

dishRouter.get('/getDishesByMenu', dishController.getDishesByMenu)

export default dishRouter