import express from  'express'
import connectDb from './config/db.js'
import authRoutes from './routes/authRoutes.js'
import hotelRoutes from './routes/hotelRoutes.js'
import cors from 'cors'
import roomRoutes from "./routes/roomRoutes.js"
import cookieParser from 'cookie-parser'
import { port } from './config/config.js'
import bookingRoutes from './routes/bookingRoutes.js'

const app =express()
const Port= port || 5000
connectDb()
app.use(cookieParser())
app.use(cors())
app.use(express.json());
app.use(express.urlencoded({extended:true}));
app.use("/api/users",authRoutes)
app.use("/api/hotels",hotelRoutes)
app.use("/api/rooms",roomRoutes)
app.use("/api/book",bookingRoutes)

app.get("/",(req,res)=>{
   res.send("<h1>Welcome to hotel booking server</h1>")
})

app.listen(5000, '0.0.0.0', () => {
   console.log('Server is running on port 5000');
 });