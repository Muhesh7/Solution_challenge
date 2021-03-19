import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../looks/gardeningtools_look.dart';

class Soilsoverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("SoilAndFertilizers")
          .snapshots(),
      builder: (ctx, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final products = snap.data.documents;
        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (ctx, index) {
            return Gardeningtoolslook(
              imageurl: products[index]["imageurl"],
              title: products[index]["title"],
              price: products[index]["price"],
              id: products[index].documentID,
            );
          },
        );
      },
    );
  }
}
