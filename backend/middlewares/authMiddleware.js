import jwt from 'jsonwebtoken'
import User from '../models/userModel.js'

export const protect = async (req,res,next)=>{
   const token= req.headers.Authentication?.split(" ")[1]

   if(!token){
      return res.status(401).json({message: "Not Authorized"})
   }

   try{
      const decoded = jwt.verify(token,process.env.JWT_SECRET)
      req.user = await User.findById(decoded.id).select("-password")
      next();
   }catch (eror){
      return res.status(401).json({message: "token failed"})
   }
}

export const adminOnly = async (req,res)=>{
   if(req.user && req.user.role === "admin"){
      next()
   }else{
      return res.status(403).json({message: "Admin access required"})
   }
}
