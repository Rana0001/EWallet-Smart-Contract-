const mongoose = require('mongoose')

//Create Wallet Schema
const WalletSchema = new mongoose.Schema({
    name: {
        type: String,

    },
    address: {
        type: String,
        
    },
    transactionId:{
        type: String,
    },
    amount: {
        type: Number,

    },
    date: { 
        type: String,
        default: Date.now
    }

})