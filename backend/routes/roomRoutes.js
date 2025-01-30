import express from 'express'
import { addRoom, getRooms } from '../controllers/roomController.js'
import { getBookingById } from '../controllers/bookingController.js'
import uploud from '../middlewares/upload.js'

const router = express.Router()

router.post('/add',uploud.single('image'),addRoom)
router.get("/",getRooms)
router.get("/:id",getBookingById)

export default router