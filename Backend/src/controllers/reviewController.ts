import { PrismaClient, Review } from '@prisma/client';
import { Request, Response } from 'express';
import { HttpStatusCode, ErrorTitle, ErrorMessage } from '../core/enums/response';
import { HttpError } from '../core/response/httpError';
import CustomResponse from '../core/response/apiResponse';
import { handleError } from '../core/utils/errorHandler';

const prisma = new PrismaClient();

// Add a new review for a dish
const createReview = async (req: Request, res: Response) => {
  const { userId, dishId, rating, comment } = req.body;

  try {
    if (!userId || !dishId || !rating || !comment) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_INPUT, ErrorMessage.INVALID_INPUT);
    }

    const newReview = await prisma.review.create({
      data: {
        userId,
        dishId,
        rating,
        comment,
      },
    });

    const responseNewReview = {
        id: newReview.id,
        userId: newReview.userId,
        dishId: newReview.dishId,
        rating: newReview.rating,
        comment: newReview.comment,
      }

    new CustomResponse(res).send(responseNewReview);
  } catch (error) {
    handleError(error, res);
  }
};

// Retrieve a review by its ID or by dish ID or both
const getReviewById = async (req: Request, res: Response) => {
    const { id } = req.body;
  
    try {
        if (!id) {
            throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
          }

          const review = await prisma.review.findUnique({
            where: { id },
          });
      
          if (!review) {
            throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
          }
      
          const responseReview = {
            id: review.id,
            userId: review.userId,
            dishId: review.dishId,
            rating: review.rating,
            comment: review.comment,
          }
    
  
      new CustomResponse(res).send(responseReview);
    } catch (error) {
      handleError(error, res);
    }
  };
  
// Update review details
const updateReview = async (req: Request, res: Response) => {
  const { id ,rating, comment } = req.body;

  try {
    if (!id || !rating) {
        throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_INPUT, ErrorMessage.INVALID_INPUT);
      }

    const updatedReview = await prisma.review.update({
      where: { id },
      data: {
        rating,
        comment,
      },
    });

    const responseUpdatedReview = {
        id: updatedReview.id,
        userId: updatedReview.userId,
        dishId: updatedReview.dishId,
        rating: updatedReview.rating,
        comment: updatedReview.comment,
      }

    new CustomResponse(res).send(responseUpdatedReview);
  } catch (error) {
    handleError(error, res);
  }
};

// Delete a review
const deleteReview = async (req: Request, res: Response) => {
  const { id } = req.body;

  try {
    if (!id) {
        throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
      }

 await prisma.review.delete({
      where: { id },
    });

    new CustomResponse(res).send({ message: 'Review deleted successfully.' });
  } catch (error) {
    handleError(error, res);
  }
};

// Retrieve all reviews for a specific dish or user or both
const getReviews = async (req: Request, res: Response) => {
  const { dishId, userId } = req.body;

  try {
    let reviews: Review[] = [];
    if (dishId && userId) {
      reviews = await prisma.review.findMany({
        where: {
          dishId,
          userId,
        },
      });
    } else if (dishId) {
      reviews = await prisma.review.findMany({
        where: {
          dishId,
        },
      });
    } else if (userId) {
      reviews = await prisma.review.findMany({
        where: {
          userId,
        },
      });
    } else {
      reviews = await prisma.review.findMany();
    }

    const responseReviews = reviews.map((review) => ({
        id: review.id,
        userId: review.userId,
        dishId: review.dishId,
        rating: review.rating,
        comment: review.comment,
      }));
  

    new CustomResponse(res).send(responseReviews);
  } catch (error) {
    handleError(error, res);
  }
};

export {
  createReview,
  getReviewById,
  updateReview,
  deleteReview,
  getReviews,
};
