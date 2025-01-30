import Booking from '../models/bookingModel.js'; 
import User from '../models/userModel.js'; 
import Room from '../models/roomModal.js'; 

// Add a new booking
export const addBooking = async (req, res) => {
  const { user_id, room_id, check_in_date, check_out_date, total_price, booking_status } = req.body;

  try {
    // Check if the user exists
    const user = await User.findById(user_id);
    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }

    // Check if the room exists
    const room = await Room.findById(room_id);
    if (!room) {
      return res.status(404).json({ message: "Room not found" });
    }

    // Create a new booking object and save it to the database
    const booking = await Booking.create({
      user_id,
      room_id,
      check_in_date,
      check_out_date,
      total_price,
      booking_status,
    });

    // Return the created booking details in the response
    res.status(200).json({
      booking: {
        _id: booking._id,
        user_id: booking.user_id,
        room_id: booking.room_id,
        check_in_date: booking.check_in_date,
        check_out_date: booking.check_out_date,
        total_price: booking.total_price,
        booking_status: booking.booking_status
      }
    });
  } catch (error) {
    res.status(500).json({ message: "Error adding booking", error });
  }
};

// Get all bookings
export const getBookings = async (req, res) => {
  try {
    const bookings = await Booking.find().populate('user_id').populate('room_id');
    if (!bookings) {
      return res.status(404).json({ message: 'No bookings found' });
    }
    res.status(200).json(bookings);
  } catch (error) {
    res.status(500).json({ message: 'Error fetching bookings', error });
  }
};

// Search bookings by user and booking status
export const searchBookings = async (req, res) => {
  try {
    const { user_id, booking_status } = req.query; // Get search params from query

    // Initialize the query object
    let query = {};

    // Apply user filter if provided
    if (user_id) {
      query.user_id = user_id;
    }

    // Apply booking status filter if provided
    if (booking_status) {
      query.booking_status = booking_status;
    }

    // Fetch bookings based on the query
    const bookings = await Booking.find(query).populate('user_id').populate('room_id');

    if (!bookings.length) {
      return res.status(404).json({ message: "No bookings found matching your search criteria" });
    }

    res.status(200).json(bookings); // Return the filtered bookings
  } catch (error) {
    res.status(500).json({ message: 'Error fetching bookings', error });
  }
};

// Get a single booking by ID
export const getBookingById = async (req, res) => {
  try {
    const { id } = req.params;
    const booking = await Booking.findById(id).populate('user_id').populate('room_id');

    if (!booking) {
      return res.status(404).json({ message: "Booking not found" });
    }

    res.status(200).json(booking);
  } catch (error) {
    res.status(500).json({ message: 'Error fetching booking by ID', error });
  }
};

// Update a booking by ID (e.g., change booking status)
export const updateBooking = async (req, res) => {
  const { id } = req.params;
  const { check_in_date, check_out_date, total_price, booking_status } = req.body;

  try {
    const updatedBooking = await Booking.findByIdAndUpdate(
      id,
      {
        check_in_date,
        check_out_date,
        total_price,
        booking_status,
      },
      { new: true } // Returns the updated document
    ).populate('user_id').populate('room_id');

    if (!updatedBooking) {
      return res.status(404).json({ message: "Booking not found" });
    }

    res.status(200).json(updatedBooking);
  } catch (error) {
    res.status(500).json({ message: 'Error updating booking', error });
  }
};

// Delete a booking by ID
export const deleteBooking = async (req, res) => {
  const { id } = req.params;

  try {
    const deletedBooking = await Booking.findByIdAndDelete(id);

    if (!deletedBooking) {
      return res.status(404).json({ message: "Booking not found" });
    }

    res.status(200).json({ message: 'Booking deleted successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Error deleting booking', error });
  }
};
