import dotenv from 'dotenv'

dotenv.config()

export const port=process.env.PORT;
export const JWT_SECRET=process.env.JWT_SECRET
export const CLOUD_NAME=process.env.CLOUD_NAME;
export const CLOUDINARY_API=process.env.CLOUDINARY_API;
export const CLOUDINARY_API_SECRET=process.env.CLOUDINARY_API_SECRET;

