import 'package:flutter/material.dart';
import 'package:Millichange/looks/orderDetails_look.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

class OrdersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("orders").snapshots(),
      builder: (ctx, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final orderDetails = snap.data.documents;
        log('data: ${orderDetails[0].documentID}');
        return ListView.builder(
          itemCount: orderDetails.length,
          itemBuilder: (ctx, index) {
            return OrderDetailsLook(
                id: orderDetails[index].documentID,
                name: orderDetails[index]["address"]["name"],
                address: orderDetails[index]["address"]["address"],
                district: orderDetails[index]["address"]["district"],
                items: (orderDetails[index]["order_list"].length).toString());
          },
        );
      },
    );
  }
}
