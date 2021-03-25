import 'package:Millichange/looks/customerOrder_look.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class OrderDetailsoverview extends StatelessWidget {
  final String id;
  OrderDetailsoverview({this.id});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection("orders").doc(id).snapshots(),
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
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(5, 10, 7, 7),
                            child: Row(children: [
                              Text("Name:",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                              Text(order["address"]["name"],
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
                              "${order["address"]["address"]}\n${order["address"]["district"]}\n${order["address"]["pin_no"]}"
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
                              Text("${order["address"]["phone_no"]}",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black))
                            ])),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 20, 10, 10),
                          child: Text("Order-List:",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                        ),
                        Container(
                          height: size.height * 0.5,
                          child: ListView.builder(
                            itemCount: order["order_list"].length,
                            itemBuilder: (ctx, index) {
                              //   List<Map<String,String>> items=[{'name':}];
                              return CustomerOrderinglook(
                                  title: order["order_list"][index]["title"],
                                  imageurl: order["order_list"][index]
                                      ["imageurl"],
                                  id: order["order_list"][index]["id"],
                                  price: order["order_list"][index]["price"],
                                  quantity: order["order_list"][index]
                                      ["quantity"],
                                  index: (index + 1).toString());
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          },
        );
      },
    );
  }
}
