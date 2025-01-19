import express from 'express'
import { addRoom } from '../controllers/roomController'

const router = express.Router()

router.post('/add',addRoom)

export default router