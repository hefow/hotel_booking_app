import Hotel from "../models/hotelModel.js";
import Room from "../models/roomModal.js";


export const addRoom = async (req, res) => {
   try {
     const { hotelId, roomNumber, type, price, amenities, description } = req.body;
 
     const room = await Hotel.findById(roomNumber);
     if (!room) {
       return res.status(404).json({ message: 'room not found' });
     }
 
     const newRoom = new Room({
       hotelId,
       roomNumber,
       type,
       price,
       amenities,
       description,
       photos: req.body.photos || [], 
     });
 
     await newRoom.save();
     res.status(201).json({ message: 'Room added successfully', room: newRoom });
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