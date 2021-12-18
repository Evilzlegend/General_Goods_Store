import 'package:flutter/material.dart';
import 'api.dart';
import 'main.dart';

class Update extends StatefulWidget {
  final int Catigory;
  final String Id, Brand, Name, Price, Qty;
  final Color PassedColor;

  Update(this.Id, this.Brand, this.Name, this.Price, this.Qty, this.PassedColor,
      this.Catigory);

  @override
  _UpdateState createState() =>
      _UpdateState(Id, Brand, Name, Price, Qty, PassedColor, Catigory);
}

class _UpdateState extends State<Update> {
  final int Catigory;
  final String Id, Brand, Name, Price, Qty;
  final Color PassedColor;
  final InventoryApi api = InventoryApi();

  _UpdateState(this.Id, this.Brand, this.Name, this.Price, this.Qty,
      this.PassedColor, this.Catigory);

  late TextEditingController InsertBrand, InsertName, InsertPrice, InsertQty;

  void initState() {
    InsertName = TextEditingController();
    InsertName.text = Name;
    InsertBrand = TextEditingController();
    InsertBrand.text = Brand;
    InsertPrice = TextEditingController();
    InsertPrice.text = Price;
    InsertQty = TextEditingController();
    InsertQty.text = Qty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Brand + "\n" + Name,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        backgroundColor: PassedColor,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 199, child: Text("Brand Name")),
                  SizedBox(
                    width: 199,
                    child: TextFormField(
                      controller: InsertBrand,
                    ),
                  )
                ],
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 199, child: Text("Product Name")),
                  SizedBox(
                    width: 199,
                    child: TextFormField(
                      controller: InsertName,
                    ),
                  )
                ],
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 199, child: Text("Price")),
                  SizedBox(
                    width: 199,
                    child: TextFormField(
                      controller: InsertPrice,
                    ),
                  )
                ],
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 199, child: Text("Quantity")),
                  SizedBox(
                    width: 199,
                    child: TextFormField(
                      controller: InsertQty,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FloatingActionButton.extended(
                          backgroundColor: PassedColor,
                          onPressed: () => {
                            if (int.tryParse(InsertQty.text) != null &&
                                double.tryParse(InsertPrice.text) != null)
                              {
                                if (Catigory == 0)
                                  {
                                    api.editAppliance(
                                        Id,
                                        InsertBrand.text,
                                        InsertName.text,
                                        InsertPrice.text,
                                        InsertQty.text)
                                  }
                                else if (Catigory == 1)
                                  {
                                    api.editElectronics(
                                        Id,
                                        InsertBrand.text,
                                        InsertName.text,
                                        InsertPrice.text,
                                        InsertQty.text)
                                  }
                                else if (Catigory == 2)
                                  {
                                    api.editHardware(
                                        Id,
                                        InsertBrand.text,
                                        InsertName.text,
                                        InsertPrice.text,
                                        InsertQty.text)
                                  }
                                else if (Catigory == 3)
                                  {
                                    api.editHomegoods(
                                        Id,
                                        InsertBrand.text,
                                        InsertName.text,
                                        InsertPrice.text,
                                        InsertQty.text)
                                  }
                                else if (Catigory == 4)
                                  {
                                    api.editPerishable(
                                        Id,
                                        InsertBrand.text,
                                        InsertName.text,
                                        InsertPrice.text,
                                        InsertQty.text)
                                  }
                              },
                            Navigator.pop(context),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MyHomePage(title: "Placeholder")))
                          },
                          label: const Text("Update Entry"),
                          icon: Icon(Icons.save_sharp),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FloatingActionButton.extended(
                          backgroundColor: Colors.red.shade800,
                          onPressed: () => {
                            if (Catigory == 0)
                              {api.deleteAppliance(Id)}
                            else if (Catigory == 1)
                              {api.deleteElectronics(Id)}
                            else if (Catigory == 2)
                              {api.deleteHardware(Id)}
                            else if (Catigory == 3)
                              {api.deleteHomegoods(Id)}
                            else if (Catigory == 4)
                              {api.deletePerishables(Id)},
                            Navigator.pop(context),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MyHomePage(title: "Placeholder")))
                          },
                          label: const Text("Delete Entry"),
                          icon: Icon(Icons.save_sharp),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 120,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: FloatingActionButton(
                    backgroundColor: PassedColor,
                    child: Icon(Icons.home),
                    onPressed: () => {
                      Navigator.pop(context),
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyHomePage(title: "Placeholder")))
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
