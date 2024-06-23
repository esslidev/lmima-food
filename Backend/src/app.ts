import express from 'express'
import { createServer } from 'http'
import { Server } from 'socket.io'
import cors from 'cors'
import { authMiddleware, integrationAuthMiddleware } from './middlewares/authMidleware'
import authRoutes from './routes/authRoutes'
import { configDotenv } from 'dotenv'
import userRoutes from './routes/userRoutes'
import sellerRoutes from './routes/sellerRoutes'
import menuRoutes from './routes/menuRoutes'
import dishRoutes from './routes/dishRoutes'
import orderRoutes from './routes/orderRoutes'
import cartRoutes from './routes/cartRoutes'
import wishlistRoutes from './routes/wishlistRoutes'
import reviewRoutes from './routes/reviewRoutes'

configDotenv({ path: __dirname + '../../../.env' })

const app = express()
const port = process.env.HTTP_PORT || 4000

console.log(process.env.HTTP_PORT)

// remember to strict the cors in production
const corOptions = {
  origin: ['http://btspfe.dev', 'http://localhost:3000', 'http://localhost:3100','*'],
}

// this part is for initiating the socket.io
const httpServer = createServer(app)
const io = new Server(httpServer, {
  cors: corOptions,
})

app.use(cors(corOptions))
app.use(express.json({ limit: '10mb' }))
app.use(express.json())
app.use(express.urlencoded({ extended: true }))

app.use('/api/auth', integrationAuthMiddleware, authRoutes)
app.use('/api/users', authMiddleware, userRoutes)
app.use('/api/sellers', authMiddleware, sellerRoutes)
app.use('/api/menus', authMiddleware, menuRoutes)
app.use('/api/dishes', authMiddleware, dishRoutes)
app.use('/api/orders', authMiddleware, orderRoutes)
app.use('/api/cart', authMiddleware, cartRoutes)
app.use('/api/wishlist', authMiddleware, wishlistRoutes)
app.use('/api/reviews', authMiddleware, reviewRoutes)

app.get('/', async (req, res, next) => {
  res.send({ message: '🚀 API ready to serve! 🚀' })
})

httpServer.listen(port, () => console.log(`🚀 API istening at http://localhost:${port} 🚀`))
