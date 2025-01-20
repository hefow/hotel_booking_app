import express from 'express'
import { addHotel, getHotels } from '../controllers/hotelController.js'
import multer from 'multer'

const upload = multer({ dest: 'uploads/' });

const router =express.Router();

router.post("/addhotel",upload.single('image'), addHotel)
router.get("/", getHotels)

export default router