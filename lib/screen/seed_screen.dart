import 'package:flutter/material.dart';

import '../screen/commonapp_drawer.dart';

import '../widgets/seed_overview.dart';

class Seedscreen extends StatelessWidget {

  static const route = "Seedscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Seeds"),
      ),
      body: Seedoverview(),
      drawer: CommonAppdrawer(),
    );
  }
}
