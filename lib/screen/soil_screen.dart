import 'package:flutter/material.dart';

import '../screen/commonapp_drawer.dart';

import '../widgets/soil_overview.dart';

class Soilscreen extends StatelessWidget {
  static const route = "./Soilscreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Soil And Fertilizers"),
        backgroundColor: Colors.green,
      ),
      body: Soilsoverview(),
      drawer: CommonAppdrawer(),
    );
  }
}
