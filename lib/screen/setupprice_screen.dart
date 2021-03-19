import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../providers/Order.dart';

import '../screen/ordering_screen.dart';

class Setuppricescreen extends StatefulWidget {
  static const route = "./Setuppricescreen";
  @override
  _SetuppricescreenState createState() => _SetuppricescreenState();
}

class _SetuppricescreenState extends State<Setuppricescreen> {
  bool isinit = true;
  String id;

  String title;
  String imageurl;

  void didChangeDependencies() async {
    if (isinit == true) {
      final ids = ModalRoute.of(context).settings.arguments as String;
      id = ids;

      final data = await FirebaseFirestore.instance
          .collection("gardeningsetup")
          .doc(id)
          .get();
      final datas = data.data();

      imageurl = datas["imageurl"][0];

      title = datas["title"];

      isinit = false;
    }

    super.didChangeDependencies();
  }

  List<String> areacovered = [
    ">500 sq.ft",
    "500 to 1000 sq.ft",
    "1000-2000 sq.ft",
    ".<2000 sq.ft"
  ];
  List<String> typeofproperty = [
    "House",
    "Industry",
    "Office",
  ];

  String acovered = "500 to 1000 sq.ft";
  int price = 300;
  String top = "House";
  List<DropdownMenuItem<String>> menuitem = List();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final order = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Price Details"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      child: Text("Type of property"),
                    ),
                    SizedBox(height: 10),
                    Container(
                      color: Colors.blue[500],
                      child: DropdownButton(
                          items: typeofproperty
                              .map<DropdownMenuItem<String>>((e) =>
                                  DropdownMenuItem(child: Text(e), value: e))
                              .toList(),
                          onChanged: (e) {
                            setState(() {
                              top = e;
                            });
                          },
                          hint: Text(
                            "Type of property",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          value: top),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Text("Area covered"),
                    ),
                    SizedBox(height: 10),
                    Container(
                      color: Colors.blue[500],
                      child: DropdownButton(
                        items: areacovered
                            .map<DropdownMenuItem<String>>((e) =>
                                DropdownMenuItem(child: Text(e), value: e))
                            .toList(),
                        onChanged: (e) {
                          setState(() {
                            acovered = e;
                            if (e == ">500 sq.ft") {
                              price = 200;
                            } else if (e == "500 to 1000 sq.ft") {
                              price = 300;
                            } else if (e == "1000-2000 sq.ft") {
                              price = 400;
                            } else {
                              price = 500;
                            }
                          });
                        },
                        hint: Text(
                          "Area covered",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        value: acovered,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: size.width * 0.6,
                  child: Text("Initial payment for sight viewing and design",
                      maxLines: 3, style: TextStyle(fontSize: 18)),
                ),
                Container(
                    height: 50,
                    width: size.width * 0.2,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.green)),
                    child: Center(
                        child: Text(
                      "₹" + "" + price.toString(),
                      style: TextStyle(fontSize: 20),
                    )))
              ],
            ),
            SizedBox(height: 50),
            RaisedButton(
                onPressed: () {
                  order.addtoorderpreview(
                      id: id,
                      title: title,
                      imageurl: imageurl,
                      price: price.toDouble(),
                      quantity: 1);
                  Navigator.of(context).pushNamed(Orderingscreen.route);
                },
                color: Colors.green,
                child: Text("Book An Appointment",
                    style: TextStyle(color: Colors.white, fontSize: 16)))
          ],
        ),
      ),
    );
  }
}
