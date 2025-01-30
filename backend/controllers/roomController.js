import Hotel from "../models/hotelModel.js";
import Room from "../models/roomModal.js";


import cloudinary from '../config/cloudinery.js'; // Import Cloudinary config

export const addRoom = async (req, res) => {
  const { hotelId, roomNumber, type, price, amenities, description } = req.body;

  try {
    // Check if the room already exists
    const room = await Room.findOne({ roomNumber });
    if (room) {
      return res.status(404).json({ message: 'Room already exists' });
    }

    // Upload image to Cloudinary if a file is provided
    let imageUrl;

    if (req.file) {
      const encodeImage = `data:image/png;base64,${req.file.buffer.toString("base64")}`;

      try {
        const cloudinaryUpload = await cloudinary.uploader.upload(encodeImage, {
          resource_type: "image",
          encoding: 'base64',
        });
        imageUrl = cloudinaryUpload.secure_url; // Store image URL
      } catch (error) {
        return res.status(500).json({ message: "Error uploading room image to Cloudinary.", error });
      }
    }

    // Create the room object
    const newRoom = await Room.create({
      hotelId,
      roomNumber,
      type,
      price,
      amenities,
      description,
      photos: imageUrl ? [imageUrl] : [], // Store image URL in the photos field
    });

    // Return the created room details in the response
    res.status(201).json({
      message: 'Room added successfully',
      room: newRoom,
    });
  } catch (error) {
    res.status(500).json({ message: 'Error adding room', error });
  }
};
 //get romms

 export const getRooms = async (req, res) => {
   try {
     const room = await Room.find();
     if (!room) {
       return res.status(404).json({ message: 'Hotel not found' });
     }
 
     res.status(200).json(room);
   } catch (error) {
     res.status(500).json({ message: 'Error fetching hotels', error });
   }
 };


 // Get rooms by hotel
export const getRoomsByHotel = async (req, res) => {
  const { hotel_id } = req.params; // Get hotel ID from the request parameters

  try {
    // Fetch rooms belonging to a specific hotel
    const rooms = await Room.find({ hotel_id: hotel_id });

    if (!rooms || rooms.length === 0) {
      return res.status(404).json({ message: 'No rooms found for this hotel' });
    }

    res.status(200).json(rooms); // Return rooms to the frontend
  } catch (error) {
    res.status(500).json({ message: 'Error fetching rooms', error });
  }
};
