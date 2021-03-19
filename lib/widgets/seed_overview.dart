import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../looks/seed_looks.dart';

import '../providers/seed.dart';

import '../screen/ordering_screen.dart';

class Seedoverview extends StatefulWidget {
  @override
  _SeedoverviewState createState() => _SeedoverviewState();
}

class _SeedoverviewState extends State<Seedoverview> {
  List<String> temperature = ["15-25 °c", "25-35 °c", "35-45 °c", "All"];
  List<String> seed = ["Vegetables", "Fruits", "Herbs", "All"];
  String ftemperature;
  String fseed;
  List<DropdownMenuItem<String>> menuitem = List();
  int quantity = 1;

  Future<void> buy(BuildContext ctx, String id) async {
    if (quantity == 0 || quantity.toString().isEmpty) {
      return showDialog(
        context: ctx,
        builder: (context) {
          return AlertDialog(
            title: Text('error'),
            content: Text('enter the quantity'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ok'))
            ],
          );
        },
      );
    } else {
      return showDialog(
        context: ctx,
        builder: (context) {
          return AlertDialog(
            title: Text('order'),
            content: Text('Do you want to continue shopping ?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('yes'),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(Orderingscreen.route);
                  },
                  child: Text('no'))
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Seed>(context);
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: size.width * 0.35,
                padding: EdgeInsets.only(left: 8),
                color: Colors.blue[300],
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: temperature
                        .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem(child: Text(e), value: e))
                        .toList(),
                    onChanged: (e) {
                      if (ftemperature == "All") {
                        setState(() {
                          fseed = null;
                          ftemperature = null;
                          data.filteredseeds(ftemperature, fseed);
                        });
                      } else {
                        setState(() {
                          ftemperature = e;
                          data.filteredseeds(ftemperature, fseed);
                        });
                      }
                    },
                    hint: Text(
                      "Temperature",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    value: ftemperature == "All" ||
                            ftemperature == null ||
                            ftemperature.isEmpty
                        ? null
                        : ftemperature,
                  ),
                ),
              ),
              Container(
                width: size.width * 0.35,
                padding: EdgeInsets.only(left: 8),
                color: Colors.blue[300],
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    items: ftemperature == null ||
                            ftemperature == "All" ||
                            ftemperature.isEmpty
                        ? menuitem
                        : seed
                            .map<DropdownMenuItem<String>>((e) =>
                                DropdownMenuItem(child: Text(e), value: e))
                            .toList(),
                    onChanged: (e) {
                      setState(() {
                        if (fseed == 'All') {
                          fseed = null;
                        } else {
                          fseed = e;
                        }
                      });
                      data.filteredseeds(ftemperature, fseed);
                    },
                    hint: Text(
                      "Seed",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    value: fseed == "All" || fseed == null || fseed.isEmpty
                        ? null
                        : fseed,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.all(10),
            height: size.height * 0.7,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Seedlooks(
                  id: data.dseed[index].id,
                  imageurl: data.dseed[index].imageurl,
                  index: index,
                  price: data.dseed[index].price,
                  title: data.dseed[index].title,
                );
              },
              itemCount: data.dseed.length,
            ),
          ),
        ],
      ),
    );
  }
}
