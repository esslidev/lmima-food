import express from 'express'

const reviewController = require('../controllers/reviewController')

const reviewRouter = express.Router()

// Define the routes
reviewRouter.post('/createReview', reviewController.createReview)
reviewRouter.get('/getReviewById', reviewController.getReviewById)
reviewRouter.put('/updateReview', reviewController.updateReview)
reviewRouter.delete('/deleteReview', reviewController.deleteReview)

reviewRouter.get('/getReviews', reviewController.getReviews)

export default reviewRouter