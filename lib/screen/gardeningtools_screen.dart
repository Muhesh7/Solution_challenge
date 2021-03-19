import 'package:flutter/material.dart';

import '../screen/commonapp_drawer.dart';

import '../widgets/gardeningtools_overview.dart';

class Gardeningtoolsscreen extends StatelessWidget {
  static const route = "Gardeningtoolsscreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gardening Tools"),
        backgroundColor: Colors.green,
      ),
      body: Gardeningtoolsoverview(),
      drawer: CommonAppdrawer(),
    );
  }
}
