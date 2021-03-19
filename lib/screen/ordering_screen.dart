import 'package:flutter/material.dart';
import '../widgets/ordering_overview.dart';

class Orderingscreen extends StatelessWidget {
  static const route = "Orderingscreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Your Orders"),
        ),
        body: Orderingoverview());
  }
}
