require("dotenv").config()
const express = require('express')
const mongoose = require('mongoose')

const app = express.Router()
const port = 3000

// Create a routes
app.get('/', (req, res) => {
    res.send('Hello World!')
})

// Start the server
app.listen(port, () => {
    console.log(`App listening at http://localhost:${port}`)
})


// Connect to MongoDB
mongoose.connect(process.env.MONGO_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true
})

