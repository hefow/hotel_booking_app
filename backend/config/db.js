import mongoose from 'mongoose'
import dotenv from 'dotenv'

dotenv.config()

const connectDb =async ()=>{
   try{
      const conn =await mongoose.connect(process.env.MONGO_URI)
      console.log(`connected to database ${conn.connection.host}`)
   }catch (err){
      console.log("error connecting to database.")
   }
}

export default connectDb