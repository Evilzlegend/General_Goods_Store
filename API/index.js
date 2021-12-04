const express = require('express');
const app = express();
const nodemon = require('nodemon');
app.use(express.json());

//mongoDB Package
const mongoose = require('mongoose');

const PORT = 1200;

const dbUrl = 'mongodb+srv://dbUser:w@#EM7pV!L4V@ggs-001.3tome.mongodb.net/GeneralGoodsStore?retryWrites=true&w=majority';
              
mongoose.connect(dbUrl,
    {
        useNewUrlParser: true,
        useUnifiedTopology: true
    })

//Mongo DB Connection

const db = mongoose.connection;

//handle DB Error, display connection
db.on('error', ()=>{
    console.error.bind(console,'connection error: ');
});

// Display Connected Message
db.once('open', () => {
    console.log('MongoDB Connected');
});

//Schema/Model Declaration
require('./Models/appliancesObject');
require('./Models/electronicsObject');
require('./Models/hardwareObject');
require('./Models/homegoodsObject');
require('./Models/perishablesObject');

const Student = mongoose.model('Student');
const Course = mongoose.model('Course');

app.get('/',(req,res) => {
    return res.status(200).json("(message: OK)");
});




app.listen(PORT, () => {
    console.log(`Server Started on Port ${PORT}`);
});
