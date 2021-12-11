const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const Hardware = new Schema({
    hardwareBrand: {
        type: String,
        required: true
    },

    hardwareModel: {
        type: String,
        required: true
    },
    hardwarePrice:
    {
        type: String,
        required: true
    },
    hardwareQuantity:
    {
        type: String, 
        required: true
    },

    hardwareYear: {
        type: String,
        required: true
    },

    hardwareExpiration: {
        type: Date,
        required: false
    },

    dateEntered:
    {
        type: Date,
        default: Date.now
    }
});
mongoose.model('Hardware', Hardware);