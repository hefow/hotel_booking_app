import mongoose from "mongoose";

const hotelSchema = new mongoose.Schema({
   name: { type: String, required: true },
   location: { type: String, required: true },
   description: { type: String },
   pricePerNight: { type: Number, required: true },
   amenities: [String], 
   rating: { type: Number, min: 0, max: 5 },
   photos: [String],
   totalRooms: { type: Number, required: true },
   availableRooms: { type: Number, required: true },
   createdAt: { type: Date, default: Date.now },
   updatedAt: { type: Date, default: Date.now  }
 });
 
 const Hotel = mongoose.model('Hotel', hotelSchema);

 export default Hotel
 