import 'package:Millichange/widgets/transDetails_overview.dart';
import 'package:flutter/material.dart';

class TransDetailscreen extends StatefulWidget {
  static const route = "TransDetailscreen";

  _TransDetailscreen createState() => _TransDetailscreen();
}

class _TransDetailscreen extends State<TransDetailscreen> {
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
          title: Text("EmployeeDetails"),
        ),
        body: TransDetailsoverview(id: id));
  }
}
