import express from  'express'
import connectDb from './config/db.js'
import authRoutes from './routes/authRoutes.js'
import hotelRoutes from './routes/hotelRoutes.js'
import cors from 'cors'

const app =express()
const port= process.env.port || 5000
connectDb()

app.use(cors())
app.use(express.json());
app.use(express.urlencoded({extended:true}));
app.use("/api/users",authRoutes)
app.use("/api/hotels",hotelRoutes)

app.get("/",(req,res)=>{
   res.send("<h1>Welcome to hotel booking server</h1>")
})

app.listen(5000, '0.0.0.0', () => {
   console.log('Server is running on port 5000');
 });