import express from 'express'
import { addRoom, getRooms } from '../controllers/roomController.js'

const router = express.Router()

router.post('/add',addRoom)
router.get("/",getRooms)

export default router