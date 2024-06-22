import { PrismaClient } from '@prisma/client';
import { Request, Response } from 'express';
import { HttpStatusCode, ErrorTitle, ErrorMessage } from '../core/enums/response';
import { HttpError } from '../core/response/httpError';
import CustomResponse from '../core/response/apiResponse';
import { handleError } from '../core/utils/errorHandler';

const prisma = new PrismaClient();

const createDish = async (req: Request, res: Response) => {
  const { menuId, name, description, price, imageUrl } = req.body;

  try {
    if (!menuId || !name || !description || !price || !imageUrl) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_INPUT, ErrorMessage.INVALID_INPUT);
    }

    const newDish = await prisma.dish.create({
      data: {
        menu: { connect: { id: menuId } },
        name,
        description,
        price,
        imageUrl,
      },
    });

    const responseNewDish = {
      id: newDish.id,
      name: newDish.name,
      description: newDish.description,
      price: newDish.price,
      imageUrl: newDish.imageUrl,
    }


    new CustomResponse(res).send({ data: responseNewDish });
  } catch (error) {
    handleError(error, res);
  }
};

const getDishById = async (req: Request, res: Response) => {
  const { id } = req.body;

  try {
    if (!id) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND)
    }

    const dish = await prisma.dish.findUnique({
      where: { id },
    });

    if (!dish) {
      throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    const responseDish = {
      id: dish.id,
      name: dish.name,
      description: dish.description,
      price: dish.price,
      imageUrl: dish.imageUrl,
    }

    new CustomResponse(res).send({ data: responseDish });
  } catch (error) {
    handleError(error, res);
  }
};

const updateDish = async (req: Request, res: Response) => {
  const { id, name, description, price, imageUrl } = req.body;

  try {
    if (!id) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND)
    }

    const updatedDishData = {
      ...(name && { name }),
      ...(description && { description }),
      ...(price && { price }),
      ...(imageUrl && { imageUrl }),
    }

    const updatedDish = await prisma.dish.update({
      where: { id },
      data: updatedDishData,
    });

    const responseUpdatedDish = {
      id: updatedDish.id,
      name: updatedDish.name,
      description: updatedDish.description,
      price: updatedDish.price,
      imageUrl: updatedDish.imageUrl,
    }

    new CustomResponse(res).send({ data: responseUpdatedDish });
  } catch (error) {
    handleError(error, res);
  }
};

const deleteDish = async (req: Request, res: Response) => {
  const { id } = req.body;

  try {
    if (!id) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND)
    }

    await prisma.dish.delete({
      where: { id },
    });

    new CustomResponse(res).send({ message: 'Dish deleted successfully.' });
  } catch (error) {
    handleError(error, res);
  }
};

const getDishesByMenu = async (req: Request, res: Response) => {
  const { menuId } = req.body;

  try {
    const dishes = await prisma.dish.findMany({
      where: { menuId },
    });

    const responseDishes = dishes.map((dish) => ({
      id: dish.id,
      name: dish.name,
      description: dish.description,
      price: dish.price,
      imageUrl: dish.imageUrl,
    }));

    new CustomResponse(res).send({ data: responseDishes });
  } catch (error) {
    handleError(error, res);
  }
};

export {
  createDish,
  getDishById,
  updateDish,
  deleteDish,
  getDishesByMenu,
};
