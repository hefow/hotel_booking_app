import mongoose from "mongoose";

const hotelSchema = new mongoose.Schema({
   name: { type: String, required: true },
   location: { type: String, required: true },
   description: { type: String },
   amenities: [String], 
   rating: { type: Number, min: 0, max: 5 },
   pricePerNight: { type: Number, required: true },
   image: {
    type:String,
    default: null
  },
   totalRooms: { type: Number, required: true },
   availableRooms: { type: Number, required: true },
   createdAt: { type: Date, default: Date.now },
   updatedAt: { type: Date, default: Date.now  }
 });
 
 const Hotel = mongoose.model('Hotel', hotelSchema);

 export default Hotel
 