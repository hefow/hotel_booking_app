import Hotel from '../models/hotelModel.js';
import fs from 'fs'

 export const addHotel = async (req,res)=>{
   const {name,location,description,pricePerNight,amenities,rating,totalRooms,availableRooms}=req.body

   // Read the uploaded file
   const image = req.file
   ? {
       data: fs.readFileSync(req.file.path),
       contentType: req.file.mimetype,
     }
   : null;

   const existHotel=await Hotel.findOne({name})
   if(existHotel){
      return res.status(403).json({message:"This hotel already exist."})
   }

   const hotel=await Hotel.create({name,location,description,pricePerNight,amenities,rating,image,totalRooms,availableRooms});

   res.status(200).json({
      hotel:{
         _id: hotel._id,
         name:hotel.name,
         description:hotel.description,
         image:hotel.image,
         pricePerNight:hotel.pricePerNight,
         location:hotel.location,
         totalRooms:hotel.totalRooms,
         rating:hotel.rating
      }
   })
 }

//get hotel
 export const getHotels = async (req, res) => {
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