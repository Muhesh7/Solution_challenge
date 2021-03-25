import 'package:Millichange/screen/employee_details.dart';
import 'package:flutter/material.dart';

class TransDetailsLook extends StatefulWidget {
  final String name;
  final String address;
  final String district;
  final String id;
  TransDetailsLook(
      {Key key, this.name, this.address, this.district, this.id, String items})
      : super(key: key);

  @override
  _TransDetailsLookState createState() => _TransDetailsLookState();
}

class _TransDetailsLookState extends State<TransDetailsLook> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: new EdgeInsets.all(10.0),
        child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(TransDetailscreen.route, arguments: widget.id);
            },
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.green,
                elevation: 20,
                child: Container(
                  padding: new EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: new EdgeInsets.all(5),
                          child: Text("Name: ${widget.name}",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white))),
                      Container(
                          padding: new EdgeInsets.all(5),
                          child: Text(
                            "Address: ${widget.address}".trim(),
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70),
                          )),
                      Container(
                          padding: new EdgeInsets.all(5),
                          child: Text(
                            "District: ${widget.district}",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white70),
                          ))
                    ],
                  ),
                ))));
  }
}
