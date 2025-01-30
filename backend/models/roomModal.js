import mongoose from "mongoose"

const roomSchema = new mongoose.Schema({
  hotelId: { type: mongoose.Schema.Types.ObjectId, ref: 'Hotel', required: true }, 
  roomNumber: { type: String, required: true, unique: true },
  type: { type: String, enum: ['single', 'double', 'suite'], required: true },
  price: { type: Number, required: true }, 
  isAvailable: { type: Boolean, default: true }, 
  amenities: { type: [String], default: [] }, 
  image: {
    type:String,
    default: null
  }, 
  description: { type: String }, 
  createdAt: { type: Date, default: Date.now }, 
});

const Room = mongoose.model('Room', roomSchema);

export default Room
