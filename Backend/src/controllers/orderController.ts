import { PrismaClient } from '@prisma/client';
import { Request, Response } from 'express';
import { HttpStatusCode, ErrorTitle, ErrorMessage } from '../core/enums/response';
import { HttpError } from '../core/response/httpError';
import CustomResponse from '../core/response/apiResponse';
import { handleError } from '../core/utils/errorHandler';

const prisma = new PrismaClient();

const createOrder = async (req: Request, res: Response) => {
  const { userId, dishId, quantity, total, paymentMethod, status, delivery } = req.body;

  try {
    if (!userId || !dishId || !quantity || !total || !paymentMethod || !status || !delivery) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_INPUT, ErrorMessage.INVALID_INPUT);
    }

    const newOrder = await prisma.order.create({
      data: {
        userId,
        dishId,
        quantity,
        total,
        paymentMethod,
        status,
        delivery,
      },
      include: {
        delivery: true,
      },
    });

    const responseNewOrder = {
        id: newOrder.id,
        dishId: newOrder.dishId,
        quantity: newOrder.quantity,
        total: newOrder.total,
        paymentMethod: newOrder.paymentMethod,
        status: newOrder.status,
        delivery: {
            id: newOrder.delivery?.id,
            address: newOrder.delivery?.address,
            status: newOrder.delivery?.status,
          },
      }

    new CustomResponse(res).send({ data: responseNewOrder });
  } catch (error) {
    handleError(error, res);
  }
};

const getOrderById = async (req: Request, res: Response) => {
  const { id } = req.body;

  try {
    if (!id) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    const order = await prisma.order.findUnique({
      where: { id },
      include: { delivery: true },
    });

    if (!order) {
      throw new HttpError(HttpStatusCode.NOT_FOUND, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    const responseOrder = {
        id: order.id,
        dishId: order.dishId,
        quantity: order.quantity,
        total: order.total,
        paymentMethod: order.paymentMethod,
        status: order.status,
        delivery: {
            id: order.delivery?.id,
            address: order.delivery?.address,
            status: order.delivery?.status,
          },
      }

    new CustomResponse(res).send({ data: responseOrder });
  } catch (error) {
    handleError(error, res);
  }
};

const updateOrderStatus = async (req: Request, res: Response) => {
  const { id, status } = req.body;

  try {
    if (!id || !status) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_INPUT, ErrorMessage.INVALID_INPUT);
    }

    const updatedOrder = await prisma.order.update({
      where: { id },
      data: { status },
    });

    const responseUpdatedOrder = {
        id: updatedOrder.id,
        dishId: updatedOrder.dishId,
        quantity: updatedOrder.quantity,
        total: updatedOrder.total,
        paymentMethod: updatedOrder.paymentMethod,
        status: updatedOrder.status,
      }

    new CustomResponse(res).send({ data: responseUpdatedOrder });
  } catch (error) {
    handleError(error, res);
  }
};

const deleteOrder = async (req: Request, res: Response) => {
  const { id } = req.body;

  try {
    if (!id) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.NOT_FOUND, ErrorMessage.NOT_FOUND);
    }

    await prisma.order.delete({
      where: { id },
    });

    new CustomResponse(res).send({ message: 'Order deleted successfully.' });
  } catch (error) {
    handleError(error, res);
  }
};

export {
  createOrder,
  getOrderById,
  updateOrderStatus,
  deleteOrder,
};
