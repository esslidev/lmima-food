import { Delivery, PrismaClient } from '@prisma/client';
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

    const responseDelivery = {
      id: newDelivery.id,
      orderId: newDelivery.orderId,
      address: newDelivery.address,
      status: newDelivery.status,
    };

    new CustomResponse(res).send({ data: responseDelivery });
  } catch (error) {
    handleError(error, res);
  }
};

const getDelivery = async (req: Request, res: Response) => {
  const { id, orderId } = req.body;

  try {
    if (!id && !orderId) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_INPUT, ErrorMessage.INVALID_INPUT);
    }

    let delivery: Delivery | null = null;
    if (id) {
      delivery = await prisma.delivery.findUnique({
        where: { id },
      });
    } else if (orderId) {
      delivery = await prisma.delivery.findFirst({
        where: { orderId },
      });
    }

    if (!delivery) {
      throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    const responseDelivery = {
      id: delivery.id,
      orderId: delivery.orderId,
      address: delivery.address,
      status: delivery.status,
    };

    new CustomResponse(res).send({ data: responseDelivery });
  } catch (error) {
    handleError(error, res);
  }
};

const updateDeliveryStatus = async (req: Request, res: Response) => {
  const { id, status } = req.body;

  try {
    if (!id || !status) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_INPUT, ErrorMessage.INVALID_INPUT);
    }

    const updatedDelivery = await prisma.delivery.update({
      where: { id },
      data: { status },
    });

    const responseUpdatedDelivery = {
      id: updatedDelivery.id,
      orderId: updatedDelivery.orderId,
      address: updatedDelivery.address,
      status: updatedDelivery.status,
    };

    new CustomResponse(res).send({ data: responseUpdatedDelivery });
  } catch (error) {
    handleError(error, res);
  }
};

const deleteDelivery = async (req: Request, res: Response) => {
  const { id } = req.body;

  try {
    if (!id) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_INPUT, ErrorMessage.INVALID_INPUT);
    }

    await prisma.delivery.delete({
      where: { id },
    });

    new CustomResponse(res).send({ message: 'Delivery deleted successfully.' });
  } catch (error) {
    handleError(error, res);
  }
};

const getDeliveries = async (req: Request, res: Response) => {
  const { id, orderId, status, address } = req.query;

  try {
    const filters: any = {};

    if (id) {
      filters.id = Number(id);
    }

    if (orderId) {
      filters.orderId = Number(orderId);
    }

    if (status) {
      filters.status = status;
    }

    if (address) {
      filters.address = { contains: address as string, mode: 'insensitive' };
    }

    const deliveries = await prisma.delivery.findMany({
      where: filters,
    });

    const responseDeliveries = deliveries.map(delivery => ({
      id: delivery.id,
      orderId: delivery.orderId,
      address: delivery.address,
      status: delivery.status,
    }));

    new CustomResponse(res).send({ data: responseDeliveries });
  } catch (error) {
    handleError(error, res);
  }
};


export {
  createDelivery,
  getDelivery,
  updateDeliveryStatus,
  deleteDelivery,
  getDeliveries,
};
