import Hotel from '../models/hotelModel.js';
import cloudinary from '../config/cloudinery.js'

export const addHotel = async (req, res) => {
  const { name, location, description, pricePerNight, amenities, rating, totalRooms, availableRooms } = req.body;

  // Check if the hotel already exists
  const existHotel = await Hotel.findOne({ name });
  if (existHotel) {
    return res.status(403).json({ message: "This hotel already exists." });
  }

  let imageUrl;

  // Check if a file was uploaded
  if (req.file) {
    // Encode the image to base64 format
    const encodeImage = `data:image/png;base64,${req.file.buffer.toString("base64")}`;

    // Upload the image to Cloudinary
    try {
      const cloudinaryUpload = await cloudinary.uploader.upload(encodeImage, {
        resource_type: "image", // Specify the type as an image
        encoding:'base64'
      });
      imageUrl = cloudinaryUpload.secure_url; // Use the URL of the uploaded image
    } catch (error) {
      return res.status(500).json({ message: "Error uploading image to Cloudinary.", error });
    }
  }

  // Create the hotel object and save it to the database
  const hotel = await Hotel.create({
    name,
    location,
    description,
    pricePerNight,
    amenities,
    rating,
    image: imageUrl, // Save the image URL in the 'image' field
    totalRooms,
    availableRooms
  });

  // Return the created hotel details in the response
  res.status(200).json({
    hotel: {
      _id: hotel._id,
      name: hotel.name,
      description: hotel.description,
      image: hotel.image,
      pricePerNight: hotel.pricePerNight,
      location: hotel.location,
      totalRooms: hotel.totalRooms,
      rating: hotel.rating
    }
  });
};

//get hotel
 export const getHotels = async (req, res) => {
   try {

     const hotel = await Hotel.find();
     if (!hotel) {
       return res.status(404).json({ message: 'Hotels not found' });
     }
 
     res.status(200).json(hotel);
   } catch (error) {
     res.status(500).json({ message: 'Error fetching hotels', error });
   }
 };


 // Search hotels by location and price range
export const searchHotels = async (req, res) => {
  try {
    const { location, minPrice, maxPrice } = req.query; // Get search params from query

    // Initialize the query object
    let query = {};

    // Apply location filter if provided
    if (location) {
      query.location = { $regex: location, $options: "i" }; // Case-insensitive search for location
    }

    // Apply price range filter if provided
    if (minPrice || maxPrice) {
      query.pricePerNight = {};

      if (minPrice) {
        query.pricePerNight.$gte = parseFloat(minPrice); // Greater than or equal to minPrice
      }

      if (maxPrice) {
        query.pricePerNight.$lte = parseFloat(maxPrice); // Less than or equal to maxPrice
      }
    }

    // Fetch hotels based on the query
    const hotels = await Hotel.find(query);

    if (!hotels.length) {
      return res.status(404).json({ message: "No hotels found matching your search criteria" });
    }

    res.status(200).json(hotels); // Return the filtered hotels
  } catch (error) {
    res.status(500).json({ message: 'Error fetching hotels', error });
  }
};

//get hotel by id
 export const getHotelById = async (req,res)=>{
  
  try {
    const {id}=req.params;

    const hotel=await Hotel.findById(id);

    if(!hotel){
      res.status(404).json({message:"hotel not found"})
    }

    res.status(200).json(hotel)
  } catch (error) {
    res.status(500).json({ message: 'Error fetching hotel by ID', error });
  }
 }