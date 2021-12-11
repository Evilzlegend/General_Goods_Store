const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const Electronics = new Schema({
    electronicsBrand: {
        type: String,
        required: true
    },

    electronicsModel:
    {
        type: String,
        required: true
    },
    electronicsPrice:
    {
        type: String,
        required: true
    },
    electronicsQuantity:
    {
        type: String, 
        required: true
    },

    electronicsYear:
    {
        type: String,
        required: true
    },

    electronicsExpiration:
    {
        type: Date,
        required: false
    },

    dateEntered:
    {
        type: Date,
        default: Date.now
    }
});
mongoose.model('Electronics', Electronics);