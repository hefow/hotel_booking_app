import express from 'express'
import { addHotel, getHotel } from '../controllers/hotelController.js'

const router =express.Router();

router.post("/addhotel",addHotel)
router.get("/", getHotel)

export default router