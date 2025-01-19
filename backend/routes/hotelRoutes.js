import express from 'express'
import { addHotel, getHotels } from '../controllers/hotelController.js'

const router =express.Router();

router.post("/addhotel",addHotel)
router.get("/", getHotels)

export default router