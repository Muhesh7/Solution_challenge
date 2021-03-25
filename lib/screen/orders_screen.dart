import 'package:Millichange/providers/Order.dart';
import 'package:Millichange/widgets/orderdetails_overview.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class OrderDetailscreen extends StatefulWidget {
  static const route = "OrderDetailscreen";

  _OrderDetailscreen createState() => _OrderDetailscreen();
}

class _OrderDetailscreen extends State<OrderDetailscreen> {
  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          }),
          backgroundColor: Colors.green,
          title: Text("OrderDetails"),
        ),
        body: OrderDetailsoverview(id: id));
  }
}
