import { PrismaClient } from '@prisma/client';
import { Request, Response } from 'express';
import { HttpStatusCode, ErrorTitle, ErrorMessage } from '../core/enums/response';
import { HttpError } from '../core/response/httpError';
import CustomResponse from '../core/response/apiResponse';
import { handleError } from '../core/utils/errorHandler';

const prisma = new PrismaClient();

const createDelivery = async (req: Request, res: Response) => {
  const { orderId, address, status } = req.body;

  try {
    if (!orderId || !address || !status) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_INPUT, ErrorMessage.INVALID_INPUT);
    }

    const newDelivery = await prisma.delivery.create({
      data: {
        orderId,
        address,
        status,
      },
    });

    new CustomResponse(res).send({ data: newDelivery });
  } catch (error) {
    handleError(error, res);
  }
};

const getDeliveryById = async (req: Request, res: Response) => {
  const { id } = req.params;

  try {
    if (!id) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    const delivery = await prisma.delivery.findUnique({
      where: { id },
    });

    if (!delivery) {
      throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    new CustomResponse(res).send({ data: delivery });
  } catch (error) {
    handleError(error, res);
  }
};

const updateDeliveryStatus = async (req: Request, res: Response) => {
  const { id } = req.params;
  const { status } = req.body;

  try {
    if (!id || !status) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_INPUT, ErrorMessage.INVALID_INPUT);
    }

    const updatedDelivery = await prisma.delivery.update({
      where: { id },
      data: { status },
    });

    new CustomResponse(res).send({ data: updatedDelivery });
  } catch (error) {
    handleError(error, res);
  }
};

const deleteDelivery = async (req: Request, res: Response) => {
  const { id } = req.params;

  try {
    if (!id) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    await prisma.delivery.delete({
      where: { id },
    });

    new CustomResponse(res).send({ message: 'Delivery deleted successfully.' });
  } catch (error) {
    handleError(error, res);
  }
};

const getDeliveryByOrder = async (req: Request, res: Response) => {
  const { orderId } = req.params;

  try {
    if (!orderId) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_INPUT, ErrorMessage.INVALID_INPUT);
    }

    const delivery = await prisma.delivery.findUnique({
      where: { orderId },
    });

    if (!delivery) {
      throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    new CustomResponse(res).send({ data: delivery });
  } catch (error) {
    handleError(error, res);
  }
};

export {
  createDelivery,
  getDeliveryById,
  updateDeliveryStatus,
  deleteDelivery,
  getDeliveryByOrder,
};
