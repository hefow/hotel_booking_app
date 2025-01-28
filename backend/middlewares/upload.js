import multer from 'multer'

const storage=multer.memoryStorage()

const uploud =multer({
   storage: storage,
   limit:{
      fileSize:5*1024*1024
   }
})

export default uploud