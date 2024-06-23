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

    const review = await prisma.review.create({
      data: {
        userId,
        dishId,
        rating,
        comment,
      },
    });

    new CustomResponse(res).send(review);
  } catch (error) {
    handleError(error, res);
  }
};

// Retrieve a review by its ID
const getReviewById = async (req: Request, res: Response) => {
  const { id } = req.params;

  try {
    const review = await prisma.review.findUnique({
      where: { id },
    });

    if (!review) {
      throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    new CustomResponse(res).send(review);
  } catch (error) {
    handleError(error, res);
  }
};

// Update review details
const updateReview = async (req: Request, res: Response) => {
  const { id } = req.params;
  const { rating, comment } = req.body;

  try {
    const updatedReview = await prisma.review.update({
      where: { id },
      data: {
        rating,
        comment,
      },
    });

    new CustomResponse(res).send(updatedReview);
  } catch (error) {
    handleError(error, res);
  }
};

// Delete a review
const deleteReview = async (req: Request, res: Response) => {
  const { id } = req.params;

  try {
    const deletedReview = await prisma.review.delete({
      where: { id },
    });

    new CustomResponse(res).send(deletedReview);
  } catch (error) {
    handleError(error, res);
  }
};

// Retrieve all reviews for a specific dish or user or both
const getReviews = async (req: Request, res: Response) => {
  const { dishId, userId } = req.body;
  let reviews: Review[];

  try {
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

    new CustomResponse(res).send(reviews);
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
