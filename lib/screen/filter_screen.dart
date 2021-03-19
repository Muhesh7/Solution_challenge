import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen/pots_screen.dart';

import '../providers/filter.dart';

class Filterscreen extends StatefulWidget {
  static const route = "Filterscreen";
  @override
  _FilterscreenState createState() => _FilterscreenState();
}

class _FilterscreenState extends State<Filterscreen> {
  bool htol;
  bool ltoh;

  List<String> sizes = [
    "Large",
    "Medium",
    "Small",
    "All",
  ];
  List<String> pottypes = [
    "Nursery",
    "Jaguar",
    "Wall Pots",
    "Hanging Pots",
    "potless Plants",
    "All",
  ];
  String fsize;
  String fpottypes;

  @override
  void didChangeDependencies() {
    final data = Provider.of<Filter>(context);
    fsize = data.size;
    fpottypes = data.pottypes;
    if (data.htol == false) {
      htol = false;
      ltoh = true;
    } else {
      htol = true;
      ltoh = false;
    }
    print(data.finalsize);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final data = Provider.of<Filter>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
            child: Center(
          child: Text(
            "Filter",
          ),
        )),
      ),
      body: Container(
        alignment: Alignment.centerRight,
        padding: new EdgeInsets.all(22.0),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
                alignment: Alignment.centerLeft,
                child: Text('Price',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green))),
            Container(
              width: size.width * 0.7,
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                secondary: const Icon(
                  Icons.arrow_circle_up,
                  color: Colors.green,
                ),
                title: const Text('Low to High '),
                activeColor: Colors.green,
                value: this.ltoh,
                onChanged: (bool value) {
                  setState(() {
                    htol = ltoh;
                    this.ltoh = value;
                  });
                },
              ),
            ),
            Container(
              width: size.width * 0.7,
              child: CheckboxListTile(
                secondary:
                    const Icon(Icons.arrow_circle_down, color: Colors.green),
                title: const Text('High to Low'),
                activeColor: Colors.green,
                value: this.htol,
                onChanged: (bool value) {
                  setState(() {
                    ltoh = htol;
                    this.htol = value;
                  });
                },
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      child: Text(
                        "Size",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700]),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      color: Colors.greenAccent,
                      child: DropdownButton(
                        items: sizes
                            .map<DropdownMenuItem<String>>((e) =>
                                DropdownMenuItem(child: Text(e), value: e))
                            .toList(),
                        onChanged: (e) {
                          setState(() {
                            fsize = e;
                          });
                        },
                        hint: Text("Size"),
                        value: fsize,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Text(
                        "Pot Types",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700]),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      color: Colors.greenAccent,
                      child: DropdownButton(
                        items: pottypes
                            .map<DropdownMenuItem<String>>((e) =>
                                DropdownMenuItem(child: Text(e), value: e))
                            .toList(),
                        onChanged: (e) {
                          setState(() {
                            fpottypes = e;
                          });
                        },
                        hint: Text("Pot Types"),
                        value: fpottypes,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),
            Center(
              child: RaisedButton(
                onPressed: () {
                  data.fdata(fsize, fpottypes, htol);
                  Navigator.of(context).pushReplacementNamed(Potsscreen.route);
                },
                child: Text(
                  "Done",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
