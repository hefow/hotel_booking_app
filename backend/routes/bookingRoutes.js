import express from 'express'
import { addBooking, deleteBooking, getBookingById, getBookings, searchBookings, updateBooking } from '../controllers/bookingController.js'

const router=express.Router()

router.post("/booking",addBooking)
router.get("/",getBookings)
router.get("/search",searchBookings)
router.get("/:id",getBookingById)
router.put("/:id",updateBooking)
router.delete("/:id",deleteBooking)

export default router;