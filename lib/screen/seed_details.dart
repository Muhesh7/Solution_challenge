import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/seed.dart';

class Seeddetails extends StatefulWidget {
  static const route = "./seeddetails";
  @override
  _SeeddetailsState createState() => _SeeddetailsState();
}

class _SeeddetailsState extends State<Seeddetails> {
  int index;
  bool isinit = true;
  @override
  void didChangeDependencies() {
    if (isinit = true) {
      final indexes = ModalRoute.of(context).settings.arguments as int;
      index = indexes;
      isinit = false;
    }
    super.didChangeDependencies();
  }

  Widget description(String text, String text1) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            width: size.width * 0.35,
            child: Text(text, style: TextStyle(fontSize: 18))),
        Row(
          children: [
            Container(
              child: Text(":  "),
            ),
            Container(
                width: size.width * 0.5,
                child: Text(
                  text1,
                  maxLines: 4,
                  style: TextStyle(fontSize: 16),
                )),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Seed>(context);
    final size = MediaQuery.of(context).size;
    return index == null
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Text(data.dseed[index].title),
              backgroundColor: Colors.green,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                      height: size.height * 0.3,
                      width: size.width * 0.8,
                      child: Image.network(data.dseed[index].imageurl,
                          fit: BoxFit.cover)),
                  SizedBox(height: 50),
                  description(
                      "Days To Maturity", data.dseed[index].daystomaturity),
                  SizedBox(height: 16),
                  description(
                      "Sowing Distance", data.dseed[index].sowingdistance),
                  SizedBox(height: 16),
                  description("Ideal Spacing", data.dseed[index].idealspacing),
                  SizedBox(height: 16),
                  description("Watering", data.dseed[index].watering),
                  SizedBox(height: 16),
                  description("Soil", data.dseed[index].soil),
                  SizedBox(height: 16),
                  description("Ph Range", data.dseed[index].phrange)
                ],
              ),
            ),
          );
  }
}
