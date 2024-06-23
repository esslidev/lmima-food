import { Cart, PrismaClient } from '@prisma/client';
import { Request, Response } from 'express';
import { HttpStatusCode, ErrorTitle, ErrorMessage } from '../core/enums/response';
import { HttpError } from '../core/response/httpError';
import CustomResponse from '../core/response/apiResponse';
import { handleError } from '../core/utils/errorHandler';

const prisma = new PrismaClient();

// Create a new user cart
const createCart = async (req: Request, res: Response) => {
  const { userId } = req.body;

  try {
    if (!userId) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_INPUT, ErrorMessage.INVALID_INPUT);
    }

    const cart = await prisma.cart.create({
      data: {
        userId: userId,
      },
      include: { items: true },
    });

    const responseNewCart = {
      id: cart.id,
      userId: cart.userId,
      items: cart.items.map((item: any) => ({
        id: item.id,
        dishId: item.dishId,
        quantity: item.quantity,
      })),
    };

    new CustomResponse(res).send(responseNewCart);
  } catch (error) {
    handleError(error, res);
  }
};

// Get cart by its ID
const getCartById = async (req: Request, res: Response) => {
  const { id } = req.body;

  try {
    const cart = await prisma.cart.findUnique({
      where: { id },
      include: { items: true },
    });

    if (!cart) {
      throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    const responseCart = {
      id: cart.id,
      userId: cart.userId,
      items: cart.items.map((item: any) => ({
        id: item.id,
        dishId: item.dishId,
        quantity: item.quantity,
      })),
    };

    new CustomResponse(res).send(responseCart);
  } catch (error) {
    handleError(error, res);
  }
};

// Add an item to an existing cart
const addItemToCart = async (req: Request, res: Response) => {
  const { userId, cartId, dishId, quantity } = req.body;

  try {
    if ((!userId && !cartId) || !dishId || !quantity) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_INPUT, ErrorMessage.INVALID_INPUT);
    }

    let cart;
    
    if (userId) {
      cart = await prisma.cart.findUnique({
        where: { userId },
        include: { items: true },
      });
    } else {
      cart = await prisma.cart.findUnique({
        where: { id: cartId },
        include: { items: true },
      });
    }

    if (!cart) {
      throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    // Check if the item already exists in the cart
    const existingCartItem = cart.items.find(item => item.dishId === dishId);

    if (existingCartItem) {
      // If item exists, update its quantity
      await prisma.cartItem.update({
        where: { id: existingCartItem.id },
        data: {
          quantity: {
            increment: quantity,
          },
        },
      });
    } else {
      // If item doesn't exist, create a new cart item
      await prisma.cartItem.create({
        data: {
          cartId: cart.id,
          dishId: dishId,
          quantity: quantity,
        },
      });
    }

    // Refresh the cart data after modification
    cart = await prisma.cart.findUnique({
      where: { id: cart.id },
      include: { items: true },
    });

    if (!cart) {
        throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
      }

    const responseCart = {
      id: cart.id,
      userId: cart.userId,
      items: cart.items.map((item: any) => ({
        id: item.id,
        dishId: item.dishId,
        quantity: item.quantity,
      })),
    };

    new CustomResponse(res).send(responseCart);
  } catch (error) {
    handleError(error, res);
  }
};

// Remove an item from an existing cart
const removeItemFromCart = async (req: Request, res: Response) => {
    const { itemId } = req.body;
  
    try {
      const cartItem = await prisma.cartItem.findUnique({
        where: { id: itemId },
        include: { cart: true },
      });
  
      if (!cartItem) {
        throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
      }
  
      await prisma.cartItem.delete({
        where: { id: itemId },
      });
  
      const cart = await prisma.cart.findUnique({
        where: { id: cartItem.cartId },
        include: { items: true },
      });
  
      if (!cart) {
        throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
      }
  
      const responseCart = {
        id: cart.id,
        userId: cart.userId,
        items: cart.items.map((item: any) => ({
          id: item.id,
          dishId: item.dishId,
          quantity: item.quantity,
        })),
      };
  
      new CustomResponse(res).send(responseCart);
    } catch (error) {
      handleError(error, res);
    }
  };
  
  // Clear all items from the cart
  const clearCart = async (req: Request, res: Response) => {
    const { cartId } = req.body;
  
    try {
      const cart = await prisma.cart.findUnique({
        where: { id: cartId },
        include: { items: true },
      });
  
      if (!cart) {
        throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
      }
  
      await prisma.cartItem.deleteMany({
        where: { cartId },
      });
  
      const responseCart = {
        id: cart.id,
        userId: cart.userId,
        items: cart.items.map((item: any) => ({
          id: item.id,
          dishId: item.dishId,
          quantity: item.quantity,
        })),
      };
  
      new CustomResponse(res).send(responseCart);
    } catch (error) {
      handleError(error, res);
    }
  };
  
  export {
    createCart,
    getCartById,
    addItemToCart,
    removeItemFromCart,
    clearCart,
  };