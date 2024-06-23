import { PrismaClient, Wishlist, WishlistItem } from '@prisma/client';
import { Request, Response } from 'express';
import { HttpStatusCode, ErrorTitle, ErrorMessage } from '../core/enums/response';
import { HttpError } from '../core/response/httpError';
import CustomResponse from '../core/response/apiResponse';
import { handleError } from '../core/utils/errorHandler';

const prisma = new PrismaClient();

// Create a new user wishlist
const createWishlist = async (req: Request, res: Response) => {
  const { userId } = req.body;

  try {
    if (!userId) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_INPUT, ErrorMessage.INVALID_INPUT);
    }

    const wishlist = await prisma.wishlist.create({
      data: {
        userId: userId,
      },
      include: { items: true },
    });

    const responseNewWishlist = {
      id: wishlist.id,
      userId: wishlist.userId,
      items: wishlist.items.map((item: WishlistItem) => ({
        id: item.id,
        dishId: item.dishId,
      })),
    };

    new CustomResponse(res).send(responseNewWishlist);
  } catch (error) {
    handleError(error, res);
  }
};

// Get wishlist by its ID
const getWishlistById = async (req: Request, res: Response) => {
  const { id } = req.params;

  try {
    const wishlist = await prisma.wishlist.findUnique({
      where: { id },
      include: { items: true },
    });

    if (!wishlist) {
      throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    const responseWishlist = {
      id: wishlist.id,
      userId: wishlist.userId,
      items: wishlist.items.map((item: WishlistItem) => ({
        id: item.id,
        dishId: item.dishId,
      })),
    };

    new CustomResponse(res).send(responseWishlist);
  } catch (error) {
    handleError(error, res);
  }
};

// Add an item to an existing wishlist
const addItemToWishlist = async (req: Request, res: Response) => {
  const { userId, wishlistId, dishId } = req.body;

  try {
    if ((!userId && !wishlistId) || !dishId) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_INPUT, ErrorMessage.INVALID_INPUT);
    }

    let wishlist;

    if (userId) {
      wishlist = await prisma.wishlist.findUnique({
        where: { userId },
        include: { items: true },
      });
    } else {
      wishlist = await prisma.wishlist.findUnique({
        where: { id: wishlistId },
        include: { items: true },
      });
    }

    if (!wishlist) {
      throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    // Check if the item already exists in the wishlist
    const existingWishlistItem = wishlist.items.find(item => item.dishId === dishId);

    if (!existingWishlistItem) {
      // If item doesn't exist, create a new wishlist item
      await prisma.wishlistItem.create({
        data: {
          wishlistId: wishlist.id,
          dishId: dishId,
        },
      });
    }

    // Refresh the wishlist data after modification
    wishlist = await prisma.wishlist.findUnique({
      where: { id: wishlist.id },
      include: { items: true },
    });

    if (!wishlist) {
      throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    const responseWishlist = {
      id: wishlist.id,
      userId: wishlist.userId,
      items: wishlist.items.map((item: WishlistItem) => ({
        id: item.id,
        dishId: item.dishId,
      })),
    };

    new CustomResponse(res).send(responseWishlist);
  } catch (error) {
    handleError(error, res);
  }
};

// Remove an item from an existing wishlist
const removeItemFromWishlist = async (req: Request, res: Response) => {
  const { itemId } = req.body;

  try {
    const wishlistItem = await prisma.wishlistItem.findUnique({
      where: { id: itemId },
      include: { wishlist: true },
    });

    if (!wishlistItem) {
      throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    await prisma.wishlistItem.delete({
      where: { id: itemId },
    });

    const wishlist = await prisma.wishlist.findUnique({
      where: { id: wishlistItem.wishlistId },
      include: { items: true },
    });

    if (!wishlist) {
      throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    const responseWishlist = {
      id: wishlist.id,
      userId: wishlist.userId,
      items: wishlist.items.map((item: WishlistItem) => ({
        id: item.id,
        dishId: item.dishId,
      })),
    };

    new CustomResponse(res).send(responseWishlist);
  } catch (error) {
    handleError(error, res);
  }
};

// Clear all items from the wishlist
const clearWishlist = async (req: Request, res: Response) => {
  const { wishlistId } = req.body;

  try {
    const wishlist = await prisma.wishlist.findUnique({
      where: { id: wishlistId },
      include: { items: true },
    });

    if (!wishlist) {
      throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    await prisma.wishlistItem.deleteMany({
      where: { wishlistId },
    });

    const responseWishlist = {
      id: wishlist.id,
      userId: wishlist.userId,
      items: wishlist.items.map((item: WishlistItem) => ({
        id: item.id,
        dishId: item.dishId,
      })),
    };

    new CustomResponse(res).send(responseWishlist);
  } catch (error) {
    handleError(error, res);
  }
};

export {
  createWishlist,
  getWishlistById,
  addItemToWishlist,
  removeItemFromWishlist,
  clearWishlist,
};
