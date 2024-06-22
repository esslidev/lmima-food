import { PrismaClient } from '@prisma/client';
import { Request, Response } from 'express';
import { HttpStatusCode, ErrorTitle, ErrorMessage } from '../core/enums/response';
import { HttpError } from '../core/response/httpError';
import { handleError } from '../core/utils/errorHandler';
import CustomResponse from '../core/response/apiResponse';

const prisma = new PrismaClient();

const getSellerById = async (req: Request, res: Response) => {
  const { sellerId } = req.body;

  try {
    const seller = await prisma.seller.findUnique({
      where: { id: sellerId },
      include: {
        menu: {
          include: {
            dishes: true,
          },
        },
      },
    });

    if (!seller) {
      throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    const responseSeller = {
      id: seller.id,
      firstName: seller.firstName,
      lastName: seller.lastName,
      email: seller.email,
      phone: seller.phone,
      address: seller.address,
      menu: seller.menu ? {
        id: seller.menu.id,
        dishes: seller.menu.dishes.map(dish => ({
          id: dish.id,
          name: dish.name,
          description: dish.description,
          price: dish.price,
          imageUrl: dish.imageUrl,
        })),
      } : null,
    };

    new CustomResponse(res).send({ data: responseSeller });
  } catch (error) {
    handleError(error, res);
  }
};

const getSellers = async (req: Request, res: Response) => {
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

    const sellers = await prisma.seller.findMany({
        where: filters,
        orderBy: order,
        skip: skip,
        take: take,
      });

    const responseSellers = sellers.map(seller => ({
      id: seller.id,
      firstName: seller.firstName,
      lastName: seller.lastName,
      email: seller.email,
      phone: seller.phone,
      address: seller.address,
      createdAt: seller.createdAt.toISOString(),
      updatedAt: seller.updatedAt.toISOString(),
    }));

    new CustomResponse(res).send({ data: responseSellers });
  } catch (error) {
    handleError(error, res);
  }
};

const updateSeller = async (req: Request, res: Response) => {
  const { sellerId,email, phone, firstName, lastName, address } = req.body;

  try {
    let existingSeller = await prisma.seller.findUnique({
        where: { id: sellerId },
      });
  
      if (!existingSeller) {
        throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
      }

      const updatedUserData = {
        ...(email && { email }),
        ...(phone && { phone }),
        ...(firstName && { firstName }),
        ...(lastName && { lastName }),
        ...(address && { address }),
      };

    const updatedSeller = await prisma.seller.update({
      where: { id: sellerId },
      data: updatedUserData,
    });

    if (!updatedSeller) {
        throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
      }

      const responseSeller = {
        email: updatedSeller.email,
        phone: updatedSeller.phone,
        firstName: updatedSeller.firstName,
        lastName: updatedSeller.lastName,
        address: updatedSeller.address,
      };

    new CustomResponse(res).send({ data: responseSeller });
  } catch (error) {
    handleError(error, res);
  }
};

const deleteSeller = async (req: Request, res: Response) => {
  const { sellerId } = req.body;

  try {
    await prisma.seller.delete({
      where: { id: sellerId },
    });

    new CustomResponse(res).send({ message: 'Seller deleted successfully.' });
  } catch (error) {
    handleError(error, res);
  }
};

const getSellerMenu = async (req: Request, res: Response) => {
  const { sellerId } = req.body;

  try {
    const menu = await prisma.menu.findUnique({
      where: { sellerId },
      include: {
        dishes: true,
      },
    });

    if (!menu) {
      throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    const responseMenu = {
      id: menu.id,
      dishes: menu.dishes.map(dish => ({
        id: dish.id,
        name: dish.name,
        description: dish.description,
        price: dish.price,
        imageUrl: dish.imageUrl,
      })),
    };

    new CustomResponse(res).send({ data: responseMenu });
  } catch (error) {
    handleError(error, res);
  }
};

export {
  getSellerById,
  getSellers,
  updateSeller,
  deleteSeller,
  getSellerMenu,
};
