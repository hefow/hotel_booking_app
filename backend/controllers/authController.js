import jwt from 'jsonwebtoken'
import User from '../models/userModel.js'
import { JWT_SECRET } from '../config/config.js'


export const registerUser =async (req,res)=>{
   try{
      const {name,email,password,phone,role} =req.body

      const existUser = await User.findOne({email})
      if(existUser){
         return res.status(403).json({message:"This user already exist"})
      }

      const user=await User.create({name,email,password,phone,role})

      res.status(201).json({
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
   if (!user) {
    return res.status(401).json({ message: "Invalid email" });
  }
   const isMatch=await user.comparePassword(password)
   if(!isMatch){
    return res.status(401).json({
      message:"invalid password"
    })
  }
  // token generation
  const expiresIn= 30 *24*60*60 //30 days

  const token = jwt.sign({_id:user._id},JWT_SECRET,{ expiresIn})

  res.cookie('token',token,{httpOnly:true,secure:false,maxAge:expiresIn* 1000})

  user.password=undefined

   res.status(200).send({...user.toJSON(),expiresIn,token})
}

// Get user profile
export const getProfile = async (req, res) => {
   try {
     const user = await User.findById(req.user._id);
 
     if (!user) {
       return res.status(404).json({ message: "User not found" });
     }
 
     res.json({
       id: user._id,
       firstName: user.firstName,
       lastName: user.lastName,
       email: user.email,
       role: user.role,
     });
   } catch (error) {
     res.status(500).json({ message: "Server error", error: error.message });
   }
 };
 
 //get all users
 export const getAllUsers = async (req, res) => {
    try {
      const users = await User.find().select('-password'); // Exclude password field
      res.status(200).json(users);
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: 'Server error' });
    }
  };
  
 
 // Update user
 export const updateUser = async (req, res) => {
   const { firstName, lastName, email, role } = req.body;
 
   try {
     const user = await User.findById(req.params.id);
 
     if (!user) {
       return res.status(404).json({ message: "User not found" });
     }
 
     user.firstName = firstName || user.firstName;
     user.lastName = lastName || user.lastName;
     user.email = email || user.email;
 
     if (req.user.role === "admin" && role) {
       user.role = role;
     }
 
     const updatedUser = await user.save();
 
     res.json({
       message: "User updated successfully",
       user: {
         id: updatedUser._id,
         firstName: updatedUser.firstName,
         lastName: updatedUser.lastName,
         email: updatedUser.email,
         role: updatedUser.role,
       },
     });
   } catch (error) {
     res.status(500).json({ message: "Server error", error: error.message });
   }
 };
 
 // Delete user
 export const deleteUser = async (req, res) => {
   try {
     const user = await User.findById(req.params.id);
 
     if (!user) {
       return res.status(404).json({ message: "User not found" });
     }
 
     await user.deleteOne();
     res.json({ message: "User deleted successfully" });
   } catch (error) {
     res.status(500).json({ message: "Server error", error: error.message });
   }
 };