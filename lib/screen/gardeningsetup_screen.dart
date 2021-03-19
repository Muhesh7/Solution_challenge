import 'package:flutter/material.dart';

import '../screen/commonapp_drawer.dart';

import '../widgets/gardeningsetup_overview.dart';

class Gardeningsetup extends StatelessWidget {
  static const route = "GardeningSetup";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gardening Setup"),
        backgroundColor: Colors.green,
      ),
      body: Gardeningsetupoverview(),
      drawer: CommonAppdrawer(),
    );
  }
}
