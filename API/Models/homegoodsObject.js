const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const Homegoods = new Schema({
    homegoodsBrand: {
        type: String,
        required: true
    },

    homegoodsModel: {
        type: String,
        required: true
    },
    homegoodsPrice:
    {
        type: String,
        required: true
    },
    homegoodsQuantity:
    {
        type: String, 
        required: true
    },

    homegoodsYear: {
        type: String,
        required: true
    },

    homegoodsExpiration: {
        type: Date,
        required: false
    },

    dateEntered:
    {
        type: Date,
        default: Date.now
    }
});
mongoose.model('Homegoods', Homegoods);