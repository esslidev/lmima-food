import { PrismaClient, Seller, User } from '@prisma/client'
import { Request, Response } from 'express'
import * as jwt from 'jsonwebtoken'
import { ErrorMessage, ErrorTitle, HttpStatusCode } from '../core/enums/response'
import { HttpError } from '../core/response/httpError'
import { handleError } from '../core/utils/errorHandler'
import {
  getJwtExpiryTime,
  isEmailValid,
  isPasswordValid,
  isTokenExpired,
  saltAndHashPassword,
  verifyPassword,
} from '../core/utils/utils'
import CustomResponse from '../core/response/apiResponse'

const prisma = new PrismaClient()

const jwtSecretToken = process.env.JWT_SECRET_ACCESS
const jwtSecretRenewToken = process.env.JWT_SECRET_RENEW

const accessTokenLifeSpan = process.env.ACCESS_TOKEN_LIFESPAN
const renewTokenLifeSpan = process.env.RENEW_TOKEN_LIFESPAN

const signUp = async (req: Request, res: Response) => {
  const { email, password, firstName, lastName, address, phone } = req.body

  try {
    // Check if user already exists
    let user: User | null = await prisma.user.findUnique({ where: { email } })

    if (user) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.USER_ALREADY_EXISTS, ErrorMessage.USER_ALREADY_EXISTS)
    }

    // Perform email validation if provided
    if (email && !isEmailValid(email)) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_EMAIL, ErrorMessage.INVALID_EMAIL)
    }

    // Perform password validation
    if (password && !isPasswordValid(password)) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_PASSWORD, ErrorMessage.INVALID_PASSWORD)
    }

     if (email && password) {
      // Sign up with email and password
      const hashedPassword = await saltAndHashPassword(password)
      user = await prisma.user.create({
        data: {
          email,
          hashedPassword: hashedPassword, 
          firstName: firstName,
          lastName: lastName,
          address: address,
          phone: phone,
        },
      })
    } else {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_SIGNUP_DATA, ErrorMessage.INVALID_SIGNUP_DATA)
    }

    if (!jwtSecretToken || !jwtSecretRenewToken) {
      throw new Error('JWT secret tokens are not configured properly in the environment variables.')
    }

    const tokenPayload = { userId: user.id }
    const finalAccessToken = jwt.sign(tokenPayload, jwtSecretToken, {
      expiresIn: getJwtExpiryTime(accessTokenLifeSpan),
    })
    const finalRenewToken = jwt.sign(tokenPayload, jwtSecretRenewToken, {
      expiresIn: getJwtExpiryTime(renewTokenLifeSpan),
    })

    new CustomResponse(res).send({ accessToken: finalAccessToken, renewToken: finalRenewToken })
  } catch (error) {
    handleError(error, res)
  }
}

const sellerSignUp = async (req: Request, res: Response) => {
  const { email, password, firstName, lastName, address, phone } = req.body

  try {
    // Check if user already exists
    let seller: Seller | null = await prisma.seller.findUnique({ where: { email } })

    if (seller) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.SELLER_ALREADY_EXISTS, ErrorMessage.SELLER_ALREADY_EXISTS)
    }

    // Perform email validation if provided
    if (email && !isEmailValid(email)) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_EMAIL, ErrorMessage.INVALID_EMAIL)
    }

    // Perform password validation
    if (password && !isPasswordValid(password)) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_PASSWORD, ErrorMessage.INVALID_PASSWORD)
    }

     if (email && password) {
      // Sign up with email and password
      const hashedPassword = await saltAndHashPassword(password)
      seller = await prisma.seller.create({
        data: {
          email,
          hashedPassword: hashedPassword, 
          firstName: firstName,
          lastName: lastName,
          address: address,
          phone: phone,
        },
      })
    } else {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_SIGNUP_DATA, ErrorMessage.INVALID_SIGNUP_DATA)
    }

    if (!jwtSecretToken || !jwtSecretRenewToken) {
      throw new Error('JWT secret tokens are not configured properly in the environment variables.')
    }

    const tokenPayload = { userId: seller.id }
    const finalAccessToken = jwt.sign(tokenPayload, jwtSecretToken, {
      expiresIn: getJwtExpiryTime(accessTokenLifeSpan),
    })
    const finalRenewToken = jwt.sign(tokenPayload, jwtSecretRenewToken, {
      expiresIn: getJwtExpiryTime(renewTokenLifeSpan),
    })

    new CustomResponse(res).send({ accessToken: finalAccessToken, renewToken: finalRenewToken })
  } catch (error) {
    handleError(error, res)
  }
}

const signIn = async (req: Request, res: Response) => {
  const { email, password } = req.body
  try {
    // Perform email validation if provided
    if (email && !isEmailValid(email)) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_EMAIL, ErrorMessage.INVALID_EMAIL)
    }
    // Perform password validation
    if (password && !isPasswordValid(password)) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_PASSWORD, ErrorMessage.INVALID_PASSWORD)
    }

    let user: User | null = null

    if (email && password) {
      // Find user by email
      user = await prisma.user.findUnique({ where: { email } })
      if (user && !(await verifyPassword(password, user.hashedPassword))) {
        throw new HttpError(
          HttpStatusCode.UNAUTHORIZED,
          ErrorTitle.INVALID_CREDENTIALS,
          ErrorMessage.INVALID_CREDENTIALS
        )
      }
    }

    if (!user) {
      throw new HttpError(HttpStatusCode.UNAUTHORIZED, ErrorTitle.INVALID_SIGNIN_DATA, ErrorMessage.INVALID_SIGNIN_DATA)
    }

    if (!jwtSecretToken || !jwtSecretRenewToken) {
      throw new Error('JWT secret tokens are not configured properly in the environment variables.')
    }

    const tokenPayload = { userId: user.id }
    const finalAccessToken = jwt.sign(tokenPayload, jwtSecretToken, {
      expiresIn: getJwtExpiryTime(accessTokenLifeSpan),
    })
    const finalRenewToken = jwt.sign(tokenPayload, jwtSecretRenewToken, {
      expiresIn: getJwtExpiryTime(renewTokenLifeSpan),
    })

    new CustomResponse(res).send({ accessToken: finalAccessToken, renewToken: finalRenewToken })
  } catch (error) {
    handleError(error, res)
  }
}

const sellerSignIn = async (req: Request, res: Response) => {
  const { email, password } = req.body
  try {
    // Perform email validation if provided
    if (email && !isEmailValid(email)) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_EMAIL, ErrorMessage.INVALID_EMAIL)
    }
    // Perform password validation
    if (password && !isPasswordValid(password)) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.INVALID_PASSWORD, ErrorMessage.INVALID_PASSWORD)
    }

    let seller: Seller | null = null

    if (email && password) {
      // Find user by email
      seller = await prisma.seller.findUnique({ where: { email } })
      if (seller && !(await verifyPassword(password, seller.hashedPassword))) {
        throw new HttpError(
          HttpStatusCode.UNAUTHORIZED,
          ErrorTitle.INVALID_CREDENTIALS,
          ErrorMessage.INVALID_CREDENTIALS
        )
      }
    }

    if (!seller) {
      throw new HttpError(HttpStatusCode.UNAUTHORIZED, ErrorTitle.INVALID_SIGNIN_DATA, ErrorMessage.INVALID_SIGNIN_DATA)
    }

    if (!jwtSecretToken || !jwtSecretRenewToken) {
      throw new Error('JWT secret tokens are not configured properly in the environment variables.')
    }

    const tokenPayload = { sellerId: seller.id }
    const finalAccessToken = jwt.sign(tokenPayload, jwtSecretToken, {
      expiresIn: getJwtExpiryTime(accessTokenLifeSpan),
    })
    const finalRenewToken = jwt.sign(tokenPayload, jwtSecretRenewToken, {
      expiresIn: getJwtExpiryTime(renewTokenLifeSpan),
    })

    new CustomResponse(res).send({ accessToken: finalAccessToken, renewToken: finalRenewToken })
  } catch (error) {
    handleError(error, res)
  }
}

const renewAccess = async (req: Request, res: Response) => {
  const { renewToken } = req.body
  try {
    if (!renewToken) {
      throw new HttpError(HttpStatusCode.BAD_REQUEST, ErrorTitle.LACK_OF_CREDENTIALS, ErrorMessage.LACK_OF_CREDENTIALS)
    }

    if (!jwtSecretRenewToken) {
      throw new Error('JWT secret renew token is not configured properly in the environment variables.')
    }

    // Verify and decode renew token
    const decodedResult = jwt.verify(renewToken, jwtSecretRenewToken) as jwt.JwtPayload

    // Check if renew token is expired
    if (!decodedResult || isTokenExpired(decodedResult.exp)) {
      throw new HttpError(HttpStatusCode.UNAUTHORIZED, ErrorTitle.TOKEN_EXPIRED, ErrorMessage.TOKEN_EXPIRED)
    }

    // Extract userId or sellerId from decoded renew token
    const userId = decodedResult.userId
    const sellerId = decodedResult.sellerId

    if (!jwtSecretToken) {
      throw new Error('JWT secret token for access token is not configured properly in the environment variables.')
    }

    // Generate new access token with either userId or sellerId
    const tokenPayload: any = {}
    if (userId) {
      tokenPayload.userId = userId
    }

    if (sellerId) {
      tokenPayload.sellerId = sellerId
    }

    const finalAccessToken = jwt.sign(tokenPayload, jwtSecretToken, {
      expiresIn: getJwtExpiryTime(accessTokenLifeSpan),
    })

    new CustomResponse(res).send({ accessToken: finalAccessToken })
  } catch (error) {
    handleError(error, res)
  }
}

module.exports = {
  signUp,
  sellerSignUp,
  signIn,
  sellerSignIn,
  renewAccess,
}
