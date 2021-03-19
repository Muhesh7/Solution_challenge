import 'package:flutter/material.dart';

import '../screen/commonapp_drawer.dart';

import '../widgets/Selfwatering_overview.dart';

class Selfwateringscreen extends StatelessWidget {
  static const route = "./Selfwateringscreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Self Watering Pots"),
        backgroundColor: Colors.green,
      ),
      body: Selfwateringoverview(),
      drawer: CommonAppdrawer(),
    );
  }
}
