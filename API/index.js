const express = require('express');
const app = express();
const nodemon = require('nodemon');
app.use(express.json());

//mongoDB Package
const mongoose = require('mongoose');

const PORT = 1200;

const dbUrl = 'mongodb+srv://dbUser:8ISAXbNK7sXUhGH9@ggs-001.3tome.mongodb.net/GeneralGoodsStore?retryWrites=true&w=majority';
              
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
require('./Models/applianceObject');
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
            appliancePrice: req.body.appliancePrice,
            applianceQuantity: req.body.applianceQuantity,
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
//edit -----------------------------------------------
app.post('/editApplianceById', async (req, res) =>{
    try{
        appliances = await Appliance.updateOne({"_id": req.body.id}
        , {
            applianceBrand: req.body.applianceBrand,
            applianceModel: req.body.applianceModel,
            appliancePrice: req.body.appliancePrice,
            applianceQuantity: req.body.applianceQuantity,
            applianceYear: req.body.applianceYear,
            applianceExpiration: req.body.applianceExpiration
        }, {upsert: true});
        if(appliances)
       {
         res.status(200).json("(message: Appliance Edited)");
            }
        else
        {
         res.status(200).json("(message: No Appliance Changed)");
        }
    }
    catch
    {
        res.status(500).json("(message: Failed to Edit Appliance)");

    }
});
//-----delete by id------------------------------------------------------------
app.post('/deleteApplianceByID', async (req,res) =>{
    try{
        let appliances = await Appliance.findOne({"_id": req.body.id});

        if(appliances){
            await Appliance.deleteOne({"_id": req.body.id});
            res.status(200).json("(message: deleted appliance successful)");

        }
        else{
            res.status(200).json("{message: No appliance deleted -- querry null}");
        }
    }
    catch{
        res.status(500).json("(message: Failed to delete appliance)");
    }
});

app.post('/addElectronic', async (req,res) => {
    try{
        let electronic = {
            electronicsBrand: req.body.electronicsBrand,
            electronicsModel: req.body.electronicsModel,
            electronicsPrice: req.body.electronicsPrice,
            electronicsQuantity: req.body.electronicsQuantity,
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
//edit -----------------------------------------------
app.post('/editElectronicById', async (req, res) =>{
    try{
        electronics = await Electronics.updateOne({"_id": req.body.id}
        , {
            electronicsBrand: req.body.electronicsBrand,
            electronicsModel: req.body.electronicsModel,
            electronicsPrice: req.body.electronicsPrice,
            electronicsQuantity: req.body.electronicsQuantity,
            electronicsYear: req.body.electronicsYear,
            electronicsExpiration: req.body.electronicsExpiration
        }, {upsert: true});
        if(electronics)
       {
         res.status(200).json("(message: Electronic Edited)");
            }
        else
        {
         res.status(200).json("(message: No Electronic Changed)");
        }
    }
    catch
    {
        res.status(500).json("(message: Failed to Edit Electronic)");

    }
});
//-----delete by id------------------------------------------------------------
app.post('/deleteElectronicByID', async (req,res) =>{
    try{
        let electronics = await Electronics.findOne({"_id": req.body.id});

        if(electronics){
            await Electronics.deleteOne({"_id": req.body.id});
            res.status(200).json("(message: deleted electronic successful)");

        }
        else{
            res.status(200).json("{message: No electronic deleted -- querry null}");
        }
    }
    catch{
        res.status(500).json("(message: Failed to delete electronic)");
    }
});

app.post('/addHardware', async (req,res) => {
    try{
        let hardware = {
            hardwareBrand: req.body.electronicsBrand,
            hardwareModel: req.body.electronicsModel,
            hardwarePrice: req.body.hardwarePrice,
            hardwareQuantity: req.body.hardwareQuantity,
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
//edit -----------------------------------------------
app.post('/hardwareById', async (req, res) =>{
    try{
        hardwares = await Hardware.updateOne({"_id": req.body.id}
        , {
            hardwareBrand: req.body.electronicsBrand,
            hardwareModel: req.body.electronicsModel,
            hardwarePrice: req.body.hardwarePrice,
            hardwareQuantity: req.body.hardwareQuantity,
            hardwareYear: req.body.electronicsYear,
            hardwareExpiration: req.body.electronicsExpiration
        }, {upsert: true});
        if(hardwares)
       {
         res.status(200).json("(message: Hardware Edited)");
            }
        else
        {
         res.status(200).json("(message: No Hardware Changed)");
        }
    }
    catch
    {
        res.status(500).json("(message: Failed to Edit Hardware)");

    }
});
//-----delete by id------------------------------------------------------------
app.post('/deleteHardwareByID', async (req,res) =>{
    try{
        let hardwares = await Hardware.findOne({"_id": req.body.id});

        if(hardwares){
            await Hardware.deleteOne({"_id": req.body.id});
            res.status(200).json("(message: deleted hardware successful)");

        }
        else{
            res.status(200).json("{message: No hardware deleted -- querry null}");
        }
    }
    catch{
        res.status(500).json("(message: Failed to delete hardware)");
    }
});


app.post('/addHomegood', async (req,res) => {
    try{
        let homegoods= {
            homegoodsBrand: req.body.homegoodsBrand,
            homegoodsModel: req.body.homegoodsModel,
            homegoodsPrice: req.body.homegoodsPrice,
            homegoodsQuantity: req.body.homegoodsQuantity,
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
        let homegood = await Homegoods.find({"homegoodsModel" : query});
        return res.status(200).json(homegood);
    }
    catch{
        return res.status(400).json("(message: Failed to Access Homegood Data)");
    }
});
//edit -----------------------------------------------
app.post('/editHomegoodById', async (req, res) =>{
    try{
        homegoods = await Homegoods.updateOne({"_id": req.body.id}
        , {
            homegoodsBrand: req.body.homegoodsBrand,
            homegoodsModel: req.body.homegoodsModel,
            homegoodsPrice: req.body.homegoodsPrice,
            homegoodsQuantity: req.body.homegoodsQuantity,
            homegoodsYear: req.body.homegoodsYear,
            homegoodsExpiration: req.body.homegoodsExpiration
        }, {upsert: true});
        if(homegoods)
       {
         res.status(200).json("(message: Homegoods Edited)");
            }
        else
        {
         res.status(200).json("(message: No Homegoods Changed)");
        }
    }
    catch
    {
        res.status(500).json("(message: Failed to Edit Homegoods)");

    }
});
//-----delete by id------------------------------------------------------------
app.post('/deleteHomegoodByID', async (req,res) =>{
    try{
        let homegoods = await Homegoods.findOne({"_id": req.body.id});

        if(homegoods){
            await Homegoods.deleteOne({"_id": req.body.id});
            res.status(200).json("(message: deleted homegood successful)");

        }
        else{
            res.status(200).json("{message: No homegood deleted -- querry null}");
        }
    }
    catch{
        res.status(500).json("(message: Failed to delete homegood)");
    }
});

app.post('/addPerishable', async (req,res) => {
    try{
        let perishable = {
            perishableBrand: req.body.perishableBrand,
            perishableName: req.body.perishableName,
            perishablePrice: req.body.appliancePrice,
            perishableQuantity: req.body.perishableQuantity,
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
        let perishable = await Perishables.find({"perishableName" : query});
        return res.status(200).json(perishable);
    }
    catch{
        return res.status(400).json("(message: Failed to Access Perishable Data)");
    }
});
//edit -----------------------------------------------
app.post('/editPerishableById', async (req, res) =>{
    try{
        perishables = await Perishables.updateOne({"_id": req.body.id}
        , {
            perishableBrand: req.body.perishableBrand,
            perishableName: req.body.perishableName,
            perishablePrice: req.body.appliancePrice,
            perishableQuantity: req.body.perishableQuantity,
            perishableStockDate: req.body.perishableStockDate,
            perishableExpiration: req.body.perishableExpiration
        }, {upsert: true});
        if(perishables)
       {
         res.status(200).json("(message: Homegoods Edited)");
            }
        else
        {
         res.status(200).json("(message: No Homegoods Changed)");
        }
    }
    catch
    {
        res.status(500).json("(message: Failed to Edit Homegoods)");

    }
});
//-----delete by id------------------------------------------------------------
app.post('/deletePerishableByID', async (req,res) =>{
    try{
        let perishables = await Perishables.findOne({"_id": req.body.id});

        if(perishables){
            await Perishables.deleteOne({"_id": req.body.id});
            res.status(200).json("(message: deleted perishable successful)");

        }
        else{
            res.status(200).json("{message: No perishable deleted -- querry null}");
        }
    }
    catch{
        res.status(500).json("(message: Failed to delete perishable)");
    }
});



app.listen(PORT, () => {
    console.log(`Server Started on Port ${PORT}`);
});
