import { PrismaClient } from '@prisma/client';
import { Request, Response } from 'express';
import { ErrorMessage, ErrorTitle, HttpStatusCode } from '../core/enums/response';
import { HttpError } from '../core/response/httpError';
import { handleError } from '../core/utils/errorHandler';
import CustomResponse from '../core/response/apiResponse';

const prisma = new PrismaClient();

const getUserById = async (req: Request, res: Response) => {
  const { userId } = req.body;

  try {
    const user = await prisma.user.findUnique({
      where: { id: userId },
      include: {
        cart: {
          include: {
            items: true,
          },
        },
        wishlist: {
          include: {
            items: true,
          },
        },
        orders: {
          include: {
            delivery: true,
          },
        },
      },
    });

    if (!user) {
      throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    const responseUser = {
      email: user.email,
      phone: user.phone,
      firstName: user.firstName,
      lastName: user.lastName,
      address: user.address,
      cart: user.cart ? {
        id: user.cart.id,
        items: user.cart.items.map(item => ({
          id: item.id,
          dishId:item.dishId,
          quantity: item.quantity,
        })),
      } : null,
      wishlist: user.wishlist ? {
        id: user.wishlist.id,
        items: user.wishlist.items.map(item => ({
          id: item.id,
          dishId:item.dishId,
        })),
      } : null,
      orders: user.orders.map(order => ({
        id: order.id,
        dishId:order.dishId,
        quantity: order.quantity,
        total: order.total,
        paymentMethod: order.paymentMethod,
        status: order.status,
        delivery: order.delivery ? {
          id: order.delivery.id,
          address: order.delivery.address,
          status: order.delivery.status,
        } : null,
      })),
    };

    new CustomResponse(res).send({ data: responseUser });
  } catch (error) {
    handleError(error, res);
  }
};

const getUsers = async (req: Request, res: Response) => {
  const { orderByAlphabets, search, limit = 10, page = 1 } = req.query;

  try {
    const take = Number(limit);
    const skip = (Number(page) - 1) * take;

    const filters: any | null = null;

    if (search) {
      filters.OR = [
        { email: { contains: search, mode: 'insensitive' } },
        { phone: { contains: search, mode: 'insensitive' } },
        { firstName: { contains: search, mode: 'insensitive' } },
        { lastName: { contains: search, mode: 'insensitive' } },
      ];
    }

    const order: any = orderByAlphabets ? { lastName: 'asc' } : { createdAt: 'desc' };

    const users = await prisma.user.findMany({
      where: filters,
      orderBy: order,
      skip: skip,
      take: take,
    });

    const responseUsers = users.map((user) => ({
      id: user.id,
      email: user.email,
      phone: user.phone,
      firstName: user.firstName,
      lastName: user.lastName,
      address: user.address,
      createdAt: user.createdAt.toISOString(),
      updatedAt: user.updatedAt.toISOString(),
    }));

    new CustomResponse(res).send({ data: responseUsers });
  } catch (error) {
    handleError(error, res);
  }
};

const updateUser = async (req: Request, res: Response) => {
  const { userId, email, phone, firstName, lastName, address } = req.body;

  try {
    let existingUser = await prisma.user.findUnique({
      where: { id: userId },
    });

    if (!existingUser) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    const updatedUserData = {
      ...(email && { email }),
      ...(phone && { phone }),
      ...(firstName && { firstName }),
      ...(lastName && { lastName }),
      ...(address && { address }),
    };

    let updateUser = await prisma.user.update({
      where: {
        id: userId,
      },
      data: updatedUserData,
    });

    if (!updateUser) {
      throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    const responseUser = {
        email: updateUser.email,
        phone: updateUser.phone,
        firstName: updateUser.firstName,
        lastName: updateUser.lastName,
        address: updateUser.address,
      };

    new CustomResponse(res).send({ data: responseUser });
  } catch (error) {
    handleError(error, res);
  }
};

const deleteUser = async (req: Request, res: Response) => {
  const { userId } = req.body;

  try {
    await prisma.user.delete({ where: { id: userId } });
    new CustomResponse(res).send({ message: 'User deleted successfully.' });
  } catch (error) {
    handleError(error, res);
  }
};

const getUserOrders = async (req: Request, res: Response) => {
    const { userId } = req.body;
  
    try {
      const orders = await prisma.order.findMany({
        where: { userId },
        include: { delivery: true },
      });
  
      if (!orders || orders.length === 0) {
        throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
      }
  
      const responseOrders = orders.map((order) => ({
        id: order.id,
        dishId:order.dishId,
        quantity: order.quantity,
        total: order.total,
        paymentMethod: order.paymentMethod,
        status: order.status,
        delivery: order.delivery ? {
          id: order.delivery.id,
          address: order.delivery.address,
          status: order.delivery.status,
        } : null,
      }));
  
      new CustomResponse(res).send({ data: responseOrders });
    } catch (error) {
      handleError(error, res);
    }
  };

  const getUserWishlist = async (req: Request, res: Response) => {
    const { userId } = req.body;
  
    try {
      const wishlist = await prisma.wishlist.findUnique({
        where: { userId },
        include: { items: true },
      });
  
      if (!wishlist) {
        throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
      }
  
      const responseWishlist = {
        id: wishlist.id,
        items: wishlist.items.map((item) => ({
          id: item.id,
          dishId: item.dishId,
        })),
      };
  
      new CustomResponse(res).send({ data: responseWishlist });
    } catch (error) {
      handleError(error, res);
    }
  };
  
  const getUserCart = async (req: Request, res: Response) => {
    const { userId } = req.body;
  
    try {
      const cart = await prisma.cart.findUnique({
        where: { userId },
        include: { items: true },
      });
  
      if (!cart) {
        throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
      }
  
      const responseCart = {
        id: cart.id,
        items: cart.items.map((item) => ({
          id: item.id,
          dishId: item.dishId,
          quantity: item.quantity,
        })),
      };
  
      new CustomResponse(res).send({ data: responseCart });
    } catch (error) {
      handleError(error, res);
    }
  };

export {
  getUserById,
  getUsers,
  updateUser,
  deleteUser,
  getUserOrders,
  getUserWishlist,
  getUserCart,
};
