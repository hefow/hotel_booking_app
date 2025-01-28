import cloudinary from 'cloudinary'
import { CLOUD_NAME, CLOUDINARY_API, CLOUDINARY_API_SECRET } from './config.js'

cloudinary.v2.config({
   cloud_name: CLOUD_NAME,
   api_key:CLOUDINARY_API,
   api_secret: CLOUDINARY_API_SECRET
})

export default cloudinary.v2

