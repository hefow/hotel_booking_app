import jwt from 'jsonwebtoken'
import Hotel from '../models/hotelModel.js';

const generateToken = (id) => {
   return jwt.sign({ id}, process.env.JWT_SECRET, {
     expiresIn: '1d',
   });
 };

 export const addHotel = async (req,res)=>{
   const {name,location,description,pricePerNight,amenities,rating,photos,totalRooms,availableRooms}=req.body

   const existHotel=await Hotel.findOne({name})
   if(existHotel){
      return res.status(403).json({message:"This hotel already exist."})
   }

   const hotel=await Hotel.create({name,location,description,pricePerNight,amenities,rating,photos,totalRooms,availableRooms});

   res.status(200).json({
      token: generateToken(hotel._id),
      hotel:{
         _id: hotel._id,
         name:hotel.name,
         description:hotel.description,
         location:hotel.location,
         totalRooms:hotel.totalRooms,
      }
   })
 }

//get hotel
 export const getHotel = async (req, res) => {
   try {
     const hotel = await Hotel.find();
     if (!hotel) {
       return res.status(404).json({ message: 'Hotel not found' });
     }
 
     res.status(200).json(hotel);
   } catch (error) {
     res.status(500).json({ message: 'Error fetching hotels', error });
   }
 };