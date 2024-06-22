import { PrismaClient } from '@prisma/client';
import { Request, Response } from 'express';
import { HttpStatusCode, ErrorTitle, ErrorMessage } from '../core/enums/response';
import { HttpError } from '../core/response/httpError';
import CustomResponse from '../core/response/apiResponse';
import { handleError } from '../core/utils/errorHandler';

const prisma = new PrismaClient();

const createMenu = async (req: Request, res: Response) => {
  const { sellerId, dishes } = req.body;

  try {
    const existingMeal = await prisma.menu.findFirst({ where: { sellerId } })

    if (existingMeal) {
      throw new HttpError(
        HttpStatusCode.BAD_REQUEST,
        ErrorTitle.MEAL_ALREADY_EXISTS,
        ErrorMessage.MEAL_ALREADY_EXISTS
      )
    }

    const newMenu = await prisma.menu.create({
      data: {
        seller: { connect: { id: sellerId } },
        dishes: {
          createMany: {
            data: dishes.map((dish: any) => ({
              name: dish.name,
              description: dish.description,
              price: dish.price,
              imageUrl: dish.imageUrl,
            })),
          },
        },
      },
      include: {
        dishes: true,
      },
    });

    const responseNewMenu = {
      id: newMenu.id,
      dishes: newMenu.dishes.map(dish => ({
        id: dish.id,
        name: dish.name,
        description: dish.description,
        price: dish.price,
        imageUrl: dish.imageUrl,
      })),
    }

    new CustomResponse(res).send({ data: responseNewMenu });
  } catch (error) {
    handleError(error, res);
  }
};

const getMenu = async (req: Request, res: Response) => {
  const { id,sellerId } = req.body;

  try {
    if (!id && !sellerId) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND)
    }

    const menu = await prisma.menu.findUnique({
      where: id ? { id } : { sellerId },
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
    }

    new CustomResponse(res).send({ data: responseMenu });
  } catch (error) {
    handleError(error, res);
  }
};

const deleteMenu = async (req: Request, res: Response) => {
  const { id,sellerId } = req.body;

  try {
    if (!id && !sellerId) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND)
    }
    await prisma.menu.delete({
      where: id ? { id } : { sellerId },
    });

    new CustomResponse(res).send({ message: 'Menu deleted successfully.' });
  } catch (error) {
    handleError(error, res);
  }
};

export {
  createMenu,
  getMenu,
  deleteMenu,
};
