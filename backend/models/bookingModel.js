import mongoose from "mongoose";

const bookingSchema = new mongoose.Schema({
  hotelId: { 
    type: mongoose.Schema.Types.ObjectId, 
    ref: 'Hotel', 
    required: true 
  },
  userId: { 
    type: mongoose.Schema.Types.ObjectId, 
    ref: 'User', 
    required: true 
  },
  roomNumber: { 
    type: String, 
    required: true 
  },
  type: { 
    type: String, 
    enum: ['single', 'double', 'suite'], 
    required: true 
  },
  checkInDate: { 
    type: Date, 
    required: true 
  },
  checkOutDate: { 
    type: Date, 
    required: true 
  },
  totalPrice: { 
    type: mongoose.Schema.Types.Decimal128, 
    required: true 
  },
  bookingStatus: { 
    type: String, 
    enum: ['Pending', 'Confirmed', 'Cancelled'], 
    required: true 
  },
  createdAt: { 
    type: Date, 
    default: Date.now 
  }
});

const Booking = mongoose.model('Booking', bookingSchema);

export default Booking;
