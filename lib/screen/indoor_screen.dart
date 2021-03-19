import 'package:flutter/material.dart';

import '../screen/commonapp_drawer.dart';

import '../widgets/indoor_overview.dart';

class Indoorscreen extends StatelessWidget {
  static const route = "./Indoorscreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Indoor And Live Plants"),
        backgroundColor: Colors.green,
      ),
      body: Indooroverview(),
      drawer: CommonAppdrawer(),
    );
  }
}
