//import 'dart:js_util';
import 'dart:async';
import 'dart:ui';
import 'api.dart';
import 'package:flutter/material.dart';
//import 'dart:developer';
import 'update.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final InventoryApi api = InventoryApi();
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool Loaded = false;
  int MenuChoice = 0;

  List Applliances = [];
  List Electronics = [];
  List Hardware = [];
  List Homegoods = [];
  List Perishables = [];
  List<String> Titles = [
    "Appliances",
    "Electronics",
    "Hardware",
    "HomeGoods",
    "Perishables"
  ];
  List<Color> AppColor = [
    Colors.amber,
    Colors.green.shade400,
    Colors.brown.shade300,
    Colors.grey,
    Colors.pink.shade100
  ];
  List<Image> DisplayImages = [
    Image.asset('assets/images/Appliances.jpg'),
    Image.asset('assets/images/Electronics.png'),
    Image.asset('assets/images/Hardware.png'),
    Image.asset('assets/images/HomeGoods.png'),
    Image.asset('assets/images/Perishables.png')
  ];

  double SidePicked = 0;

  int updateValue = 0;

  void _UpdateApp(DragEndDetails details) {
    int NewCoice = MenuChoice;

    //print(details.primaryVelocity);
    //print(details.hashCode.toString());

    if (SidePicked < 200) {
      if (NewCoice == 4) {
        NewCoice = 0;
      } else {
        NewCoice++;
      }
    } else {
      if (NewCoice == 0) {
        NewCoice = 4;
      } else {
        NewCoice--;
      }
    }

    setState(() {
      MenuChoice = NewCoice;
    });
  }

  void _StartValue(DragStartDetails details) {
    String Value = details.localPosition.toString().split(",")[0];
    String RealValue = Value.split("Offset(")[1];

    SidePicked = double.parse(RealValue);

    //print(RealValue);
  }

  void _UpdateValue(DragUpdateDetails details) {
    String Value = details.localPosition.toString().split(",")[0];
    String RealValue = Value.split("Offset(")[1];

    SidePicked = double.parse(RealValue);
  }

  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      widget.api.getAppliances().then((data) {
        setState(() {
          Applliances = data;
        });
      });

      widget.api.getElectronics().then((data) {
        setState(() {
          Electronics = data;
        });
      });

      widget.api.getHardware().then((data) {
        setState(() {
          Hardware = data;
        });
      });

      widget.api.getHomegoods().then((data) {
        setState(() {
          Homegoods = data;
        });
      });

      widget.api.getPerishables().then((data) {
        setState(() {
          Perishables = data;
          Loaded = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor[MenuChoice],
          title: Text(Titles[MenuChoice],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black))),
      body: Loaded
          ? GestureDetector(
              onHorizontalDragStart: _StartValue,
              onHorizontalDragEnd: _UpdateApp,
              onHorizontalDragUpdate: _UpdateValue,
              child: (MenuChoice == 0)
                  ? Column(
                      children: [
                        Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              DisplayImages[MenuChoice],
                              ...Applliances.map<Widget>((Appliance) =>
                                  GestureDetector(
                                    onTap: () => {
                                      Navigator.pop(context),
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Update(
                                                  Appliance['_id'],
                                                  Appliance['applianceBrand'],
                                                  Appliance['applianceModel'],
                                                  Appliance['appliancePrice'],
                                                  Appliance[
                                                      'applianceQuantity'],
                                                  AppColor[MenuChoice],
                                                  MenuChoice)))
                                    },
                                    child: _buildAppliance(
                                        Appliance['applianceQuantity'],
                                        Appliance['applianceBrand'],
                                        Appliance['applianceModel'],
                                        "\$" + Appliance['appliancePrice'],
                                        AppColor[MenuChoice]),
                                  ))
                            ],
                          ),
                        )
                      ],
                    )
                  : (MenuChoice == 1)
                      ? Column(
                          children: [
                            Expanded(
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  DisplayImages[MenuChoice],
                                  ...Electronics.map<Widget>((Electronic) =>
                                      GestureDetector(
                                          onTap: () => {
                                                Navigator.pop(context),
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => Update(
                                                            Electronic['_id'],
                                                            Electronic[
                                                                'electronicsBrand'],
                                                            Electronic[
                                                                'electronicsModel'],
                                                            Electronic[
                                                                'electronicsPrice'],
                                                            Electronic[
                                                                'electronicsQuantity'],
                                                            AppColor[
                                                                MenuChoice],
                                                            MenuChoice)))
                                              },
                                          child: _buildAppliance(
                                              Electronic['electronicsQuantity'],
                                              Electronic['electronicsBrand'],
                                              Electronic['electronicsModel'],
                                              "\$" +
                                                  Electronic[
                                                      'electronicsPrice'],
                                              AppColor[MenuChoice])))
                                ],
                              ),
                            )
                          ],
                        )
                      : (MenuChoice == 2)
                          ? Column(
                              children: [
                                Expanded(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      DisplayImages[MenuChoice],
                                      ...Hardware.map<Widget>((HardwareItems) =>
                                          GestureDetector(
                                              onTap: () => {
                                                    Navigator.pop(context),
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => Update(
                                                                HardwareItems[
                                                                    '_id'],
                                                                HardwareItems[
                                                                    'hardwareBrand'],
                                                                HardwareItems[
                                                                    'hardwareModel'],
                                                                HardwareItems[
                                                                    'hardwarePrice'],
                                                                HardwareItems[
                                                                    'hardwareQuantity'],
                                                                AppColor[
                                                                    MenuChoice],
                                                                MenuChoice)))
                                                  },
                                              child: _buildAppliance(
                                                  HardwareItems[
                                                      'hardwareQuantity'],
                                                  HardwareItems[
                                                      'hardwareBrand'],
                                                  HardwareItems[
                                                      'hardwareModel'],
                                                  "\$" +
                                                      HardwareItems[
                                                          'hardwarePrice'],
                                                  AppColor[MenuChoice])))
                                    ],
                                  ),
                                )
                              ],
                            )
                          : (MenuChoice == 3)
                              ? Column(
                                  children: [
                                    Expanded(
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: [
                                          DisplayImages[MenuChoice],
                                          ...Homegoods.map<Widget>((Homegood) =>
                                              GestureDetector(
                                                  onTap: () => {
                                                        Navigator.pop(context),
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => Update(
                                                                    Homegood[
                                                                        '_id'],
                                                                    Homegood[
                                                                        'homegoodsBrand'],
                                                                    Homegood[
                                                                        'homegoodsModel'],
                                                                    Homegood[
                                                                        'homegoodsPrice'],
                                                                    Homegood[
                                                                        'homegoodsQuantity'],
                                                                    AppColor[
                                                                        MenuChoice],
                                                                    MenuChoice)))
                                                      },
                                                  child: _buildAppliance(
                                                      Homegood[
                                                          'homegoodsQuantity'],
                                                      Homegood[
                                                          'homegoodsBrand'],
                                                      Homegood[
                                                          'homegoodsModel'],
                                                      "\$" +
                                                          Homegood[
                                                              'homegoodsPrice'],
                                                      AppColor[MenuChoice])))
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              : Column(
                                  children: [
                                    Expanded(
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: [
                                          DisplayImages[MenuChoice],
                                          ...Perishables.map<Widget>(
                                              (Homegood) => GestureDetector(
                                                  onTap: () => {
                                                        Navigator.pop(context),
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => Update(
                                                                    Homegood[
                                                                        '_id'],
                                                                    Homegood[
                                                                        'perishableBrand'],
                                                                    Homegood[
                                                                        'perishableName'],
                                                                    Homegood[
                                                                        'perishableBrand'],
                                                                    Homegood[
                                                                        'perishableQuantity'],
                                                                    AppColor[
                                                                        MenuChoice],
                                                                    MenuChoice)))
                                                      },
                                                  child: _buildExpirable(
                                                      Homegood[
                                                          'perishableQuantity'],
                                                      Homegood[
                                                          'perishableBrand'],
                                                      Homegood[
                                                          'perishableName'],
                                                      "\$" +
                                                          Homegood[
                                                              'perishablePrice'],
                                                      AppColor[MenuChoice],
                                                      DateTime.parse(Homegood[
                                                          'perishableExpiration']))))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Text("Database Loading",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  CircularProgressIndicator()
                ],
              ),
            ),
    );
  }
}

Widget _buildAppliance(String qty, String title, String subTitle, String price,
    Color BackgroundColor) {
  Widget returnValue = Padding(
      padding: const EdgeInsets.all(4),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: SizedBox(
                child: Text(
                  price + "\n" + qty + "\n" + "in stock.",
                  textAlign: TextAlign.center,
                ),
                width: 75,
              ),
              title: Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(subTitle),
              tileColor: BackgroundColor,
            )
          ],
        ),
      ));

  return (returnValue);
}

Widget _buildExpirable(String qty, String title, String subTitle, String price,
    Color BackgroundColor, DateTime ExpireDate) {
  DateTime AddedDate = ExpireDate.add(const Duration(days: 0));

  String DateString = AddedDate.year.toString() +
      "/" +
      AddedDate.month.toString() +
      "/" +
      AddedDate.day.toString();

  Widget returnValue = Padding(
      padding: const EdgeInsets.all(4),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: SizedBox(
                child: Text(
                  price + "\n" + qty + "\n" + "in stock.",
                  textAlign: TextAlign.center,
                ),
                width: 75,
              ),
              title: Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(subTitle + "\n" + "Will expire on " + DateString),
              tileColor: BackgroundColor,
            )
          ],
        ),
      ));

  return (returnValue);
}
