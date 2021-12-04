const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const Perishables = new Schema({
    perishableBrand: {
        type: String,
        required: true
    },

    perishableName: {
        type: String,
        required: true
    },

    perishableStockDate: {
        type: Date,
        required: true
    },

    perishablesExpiration: {
        type: Date,
        required: true
    },

    dateEntered:
    {
        type: Date,
        default: Date.now
    }
});
mongoose.model('Perishables', Perishables);