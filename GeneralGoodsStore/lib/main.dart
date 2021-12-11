//import 'dart:js_util';
import 'dart:ui';

import 'api.dart';
import 'package:flutter/material.dart';
//import 'dart:developer';

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

  void _UpdateApp(DragEndDetails details) {
    int NewCoice = MenuChoice;

    print(details.primaryVelocity);

    if (double.parse(details.primaryVelocity.toString()) > 0) {
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

  void initState() {
    super.initState();
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: (MenuChoice == 0)
              ? Text("Appliances")
              : (MenuChoice == 1)
                  ? Text("Electronics")
                  : (MenuChoice == 2)
                      ? Text("HardWare")
                      : (MenuChoice == 3)
                          ? Text("HomeGoods")
                          : Text("Perishables"),
        ),
        body: GestureDetector(
          onHorizontalDragEnd: _UpdateApp,
          child: (MenuChoice == 0)
              ? Column(
                  children: [
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          ...Applliances.map<Widget>((Appliance) =>
                              _buildAppliance(
                                  Appliance['applianceBrand'],
                                  Appliance['applianceModel'],
                                  "\$" + Appliance['appliancePrice'],
                                  Colors.amber))
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
                              ...Electronics.map<Widget>((Electronic) =>
                                  _buildAppliance(
                                      Electronic['electronicsBrand'],
                                      Electronic['electronicsModel'],
                                      "\$" + Electronic['electronicsPrice'],
                                      Colors.yellow))
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
                                  ...Hardware.map<Widget>((HardwareItems) =>
                                      _buildAppliance(
                                          HardwareItems['hardwareBrand'],
                                          HardwareItems['hardwareModel'],
                                          "\$" + HardwareItems['hardwarePrice'],
                                          Colors.brown))
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
                                      ...Homegoods.map<Widget>((Homegood) =>
                                          _buildAppliance(
                                              Homegood['homegoodsBrand'],
                                              Homegood['homegoodsModel'],
                                              "\$" + Homegood['homegoodsPrice'],
                                              Colors.grey))
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
                                      ...Homegoods.map<Widget>((Homegood) =>
                                          _buildExpirable(
                                              Homegood['perishableBrand'],
                                              Homegood['perishableModel'],
                                              "\$" +
                                                  Homegood['perishablePrice'],
                                              Colors.grey,
                                              Homegood['perishableStockDate']))
                                    ],
                                  ),
                                )
                              ],
                            ),
        ));
  }
}

Widget _buildAppliance(
    String title, String subTitle, String price, Color BackgroundColor) {
  Widget returnValue = Padding(
      padding: const EdgeInsets.all(4),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: SizedBox(
                child: Text(
                  price,
                  textAlign: TextAlign.center,
                ),
                width: 75,
              ),
              title: Text(title),
              subtitle: Text(subTitle),
              tileColor: BackgroundColor,
            )
          ],
        ),
      ));

  return (returnValue);
}

Widget _buildExpirable(String title, String subTitle, String price,
    Color BackgroundColor, DateTime ExpireDate) {
  DateTime AddedDate = ExpireDate.add(const Duration(days: 30));

  String DateString = AddedDate.year.toString() +
      " " +
      AddedDate.month.toString() +
      "" +
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
                  price,
                  textAlign: TextAlign.center,
                ),
                width: 75,
              ),
              title: Text(title),
              subtitle: Text(subTitle + "\n" + "Will expire on " + DateString),
              tileColor: BackgroundColor,
            )
          ],
        ),
      ));

  return (returnValue);
}
