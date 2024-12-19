import express from 'express'
import { login, registerUser, userProfile } from '../controllers/authController.js'

const router=express.Router()

router.post("/register",registerUser)
router.post("/login",login)
router.get("/profile",userProfile)

export default router