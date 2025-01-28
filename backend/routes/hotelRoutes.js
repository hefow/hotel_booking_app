import express from 'express'
import { addHotel, getHotelById, getHotels } from '../controllers/hotelController.js'
import uploud from '../middlewares/upload.js';


const router =express.Router();

router.post("/addhotel",uploud.single("image"), addHotel)
router.get("/", getHotels)
router.get("/:id",getHotelById)

export default router