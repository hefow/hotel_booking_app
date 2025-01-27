import express from 'express'
import { login, registerUser, getProfile, updateUser, deleteUser, getAllUsers } from '../controllers/authController.js'
import { protect } from '../middlewares/authMiddleware.js'

const router=express.Router()

router.post("/register",registerUser)
router.post("/login",login)
router.get("/profile",getProfile)

router.get("/",getAllUsers)

router.put("/:id",protect, updateUser)
router.delete("/:id",protect,deleteUser)

export default router