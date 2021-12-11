const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const Appliance = new Schema({
    applianceBrand: {
        type: String,
        required: true
    },

    applianceModel:
    {
        type: String,
        required: true
    },
    appliancePrice:
    {
        type: String,
        required: true
    },
    applianceQuantity:
    {
        type: String, 
        required: true
    },

    applianceYear:
    {
        type: String,
        required: true
    },

    applianceExpiration:
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
mongoose.model('Appliance', Appliance);