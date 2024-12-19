import jwt from 'jsonwebtoken'
import User from '../models/userModel.js'


const generateToken = (id) => {
   return jwt.sign({ id}, process.env.JWT_SECRET, {
     expiresIn: '1d',
   });
 };

export const registerUser =async (req,res)=>{
   try{
      const {name,email,password,phone,role} =req.body

      const existUser = await User.findOne({email})
      if(existUser){
         return res.status(403).json({message:"This user already exist"})
      }

      const user=await User.create({name,email,password,phone,role})

      res.status(201).json({
         token: generateToken(user._id),
         user:{
            _id: user._id,
            name:user.name,
            email:user.email,
            password:user.password,
            role:user.role,
            phone:user.phone
         }
      })
   }catch(error){
      console.log("eror to register user")
   }
}

//login
export const login =async (req,res)=>{
   const {email,password}=req.body

   const user=await User.findOne({email})
   const isMatch=await user.comparePassword(password)

   if(!isMatch){
      return res.status(401).json({
         message:"invalid email or password"
      })
   }
   res.json({
      token: generateToken(user._id),
      user:{
         _id: user._id,
         name:user.name,
         email:user.email,
         password:user.password,
         role:user.role,
         phone:user.phone
      }
   })
}

export const userProfile =async (req,res)=>{
   const user = await User.findById(req._id)
   if(!user){
      return res.status(404).json({
         message:"User Not Found"
      })
   }
   res.status(200).json(user)
}