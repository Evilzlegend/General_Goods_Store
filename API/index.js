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

const Appliance = mongoose.model('Appliance');
const Electronics = mongoose.model('Electronics');
const Hardware = mongoose.model('Hardware');
const Homegoods = mongoose.model('Homegoods');
const Perishables = mongoose.model('Perishables');

app.get('/',(req,res) => {
    return res.status(200).json("(message: OK)");
});

app.post('/addAppliance', async (req,res) => {
    try{
        let appliance = {
            applianceBrand: req.body.applianceBrand,
            applianceModel: req.body.applianceModel,
            applianceYear: req.body.applianceYear,
            applianceExpiration: req.body.applianceExpiration
        }
        await Appliance(appliance).save().then(c => {
            return res.status(201).json("Appliance Added");
        });
    }
    catch{
        return res.status(400).json("(message: Failed to Add Appliance - Bad Data)");
    }
});

app.get('/getAllAppliances', async (req,res) => {
    try{
        let appliances = await Appliance.find({}).lean();
        return res.status(200).json({"appliances" : appliances});
    }
    catch{
        return res.status(400).json("(message: Failed to Access Appliance Data)")
    }
});

app.get('/findAppliance', async (req,res) => {
    try{
        let query = req.body.applianceModel;
        let appliances = await Appliance.find({"applianceModel" : query});
        return res.status(200).json(appliances);
    }
    catch{
        return res.status(400).json("(message: Failed to Access Appliance Data)")
    }
});

app.post('/addElectronic', async (req,res) => {
    try{
        let electronic = {
            electronicsBrand: req.body.electronicsBrand,
            electronicsModel: req.body.electronicsModel,
            electronicsYear: req.body.electronicsYear,
            electronicsExpiration: req.body.electronicsExpiration
        }
        await Electronics(electronic).save().then(s => {
            return res.status(201).json("Electronic Added");
        });
    }
    catch {
        return res.status(400).json("(message: Failed to Add Electronic - Bad Data)");
    }
});

app.get('/getAllElectronics', async (req,res) => {
    try{
        let electronics = await Electronics.find({}).lean();
        return res.status(200).json({"electronics" : electronics});
    }
    catch{
        return res.status(400).json("(message: Failed to Access Electronics Data)");
    }
});

app.get('/findElectronic', async (req,res) => {
    try{
        let query = req.body.electronicsModel;
        let electronics = await Student.find({"electronicModel" : query});
        return res.status(200).json(electronics);
    }
    catch{
        return res.status(400).json("(message: Failed to Access Electronic Data)");
    }
});

app.post('/addHardware', async (req,res) => {
    try{
        let hardware = {
            hardwareBrand: req.body.electronicsBrand,
            hardwareModel: req.body.electronicsModel,
            hardwareYear: req.body.electronicsYear,
            hardwareExpiration: req.body.electronicsExpiration
        }
        await Hardware(hardware).save().then(s => {
            return res.status(201).json("Hardware Added");
        });
    }
    catch {
        return res.status(400).json("(message: Failed to Add Hardware - Bad Data)");
    }
});

app.get('/getAllHardware', async (req,res) => {
    try{
        let hardwares = await Hardware.find({}).lean();
        return res.status(200).json({"hardwares" : hardwares});
    }
    catch{
        return res.status(400).json("(message: Failed to Access Hardwares Data)");
    }
});

app.get('/findHardware', async (req,res) => {
    try{
        let query = req.body.hardwareModel;
        let hardware = await Hardware.find({"hardwareModel" : query});
        return res.status(200).json(hardware);
    }
    catch{
        return res.status(400).json("(message: Failed to Access Hardware Data)");
    }
});

app.post('/addHomegood', async (req,res) => {
    try{
        let homegoods= {
            homegoodsBrand: req.body.homegoodsBrand,
            homegoodsModel: req.body.homegoodsModel,
            homegoodsYear: req.body.homegoodsYear,
            homegoodsExpiration: req.body.homegoodsExpiration
        }
        await Homegoods(homegoods).save().then(s => {
            return res.status(201).json("Homegood Added");
        });
    }
    catch {
        return res.status(400).json("(message: Failed to Add Homegood - Bad Data)");
    }
});

app.get('/getAllHomegoods', async (req,res) => {
    try{
        let homegoods = await Homegoods.find({}).lean();
        return res.status(200).json({"homegoods" : homegoods});
    }
    catch{
        return res.status(400).json("(message: Failed to Access Homegoods Data)");
    }
});

app.get('/findHomegood', async (req,res) => {
    try{
        let query = req.body.homegoodsModel;
        let homegood = await Hardware.find({"homegoodsModel" : query});
        return res.status(200).json(homegood);
    }
    catch{
        return res.status(400).json("(message: Failed to Access Homegood Data)");
    }
});

app.post('/addPerishable', async (req,res) => {
    try{
        let perishable = {
            perishableBrand: req.body.perishableBrand,
            perishableName: req.body.perishableName,
            perishableStockDate: req.body.perishableStockDate,
            perishableExpiration: req.body.perishableExpiration
        }
        await Perishables(perishable).save().then(s => {
            return res.status(201).json("Perishable Added");
        });
    }
    catch {
        return res.status(400).json("(message: Failed to Add Perishable - Bad Data)");
    }
});

app.get('/getAllPerishables', async (req,res) => {
    try{
        let perishables = await Perishables.find({}).lean();
        return res.status(200).json({"perishables" : perishables});
    }
    catch{
        return res.status(400).json("(message: Failed to Access Perishables Data)");
    }
});

app.get('/findPerishable', async (req,res) => {
    try{
        let query = req.body.perishableName;
        let perishable = await Hardware.find({"perishableName" : query});
        return res.status(200).json(perishable);
    }
    catch{
        return res.status(400).json("(message: Failed to Access Perishable Data)");
    }
});




app.listen(PORT, () => {
    console.log(`Server Started on Port ${PORT}`);
});
