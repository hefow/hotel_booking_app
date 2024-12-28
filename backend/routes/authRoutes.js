import express from 'express'
import { login, registerUser, getProfile, updateUser, deleteUser } from '../controllers/authController.js'
import { protect } from '../middlewares/authMiddleware.js'

const router=express.Router()

router.post("/register",registerUser)
router.post("/login",login)
router.get("/profile",getProfile)

router.put("/:id",protect, updateUser)
router.delete("/:id",protect,deleteUser)

export default router