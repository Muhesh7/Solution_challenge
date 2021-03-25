import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TransDetailsoverview extends StatelessWidget {
  final String id;
  TransDetailsoverview({this.id});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("transgender")
          .doc(id)
          .snapshots(),
      builder: (ctx, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final order = snap.data;
        return new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight),
                    child: Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: FittedBox(
                                    child: Image.asset("assets/final.png"),
                                    fit: BoxFit.fill),
                                height: size.width / 2,
                                width: size.width,
                              ),
                              Container(
                                  padding: EdgeInsets.fromLTRB(5, 20, 7, 7),
                                  child: Row(children: [
                                    Text("Name:",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                                    Text(order["name"],
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black))
                                  ])),
                              Container(
                                padding: EdgeInsets.fromLTRB(5, 15, 2, 2),
                                child: Text("Address:",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(72, 0, 5, 5),
                                child: Text(
                                    "${order["address"]}\n${order["district"]}\n${order["pin_code"]}"
                                        .trim(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black)),
                              ),
                              Container(
                                  padding: EdgeInsets.fromLTRB(5, 20, 7, 15),
                                  child: Row(children: [
                                    Text("Phone_number: ",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                                    Text("${order["phone_no"]}",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black))
                                  ])),
                              Container(
                                  padding: EdgeInsets.fromLTRB(5, 15, 7, 15),
                                  child: Row(children: [
                                    Text("Age: ",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                                    Text("${order["age"]}",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black))
                                  ])),
                              Container(
                                  padding: EdgeInsets.fromLTRB(5, 15, 7, 15),
                                  child: Row(children: [
                                    Text("Qualification: ",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                                    Text("${order["qualification"]}",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black))
                                  ])),
                              Container(
                                  padding: EdgeInsets.fromLTRB(5, 15, 7, 15),
                                  child: Row(children: [
                                    Text("School-Name: ",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                                    Text("${order["school_name"]}",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black))
                                  ])),
                              Container(
                                  padding: EdgeInsets.fromLTRB(5, 15, 7, 15),
                                  child: Row(children: [
                                    Text("College-Name: ",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                                    Text("${order["college_name"]}",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black))
                                  ])),
                            ]))));
          },
        );
      },
    );
  }
}
