import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../looks/gardeningsetup_looks.dart';

class Gardeningsetupoverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection("gardeningsetup").snapshots(),
      builder: (ctx, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final products = snap.data.documents;
        return ListView.builder(
          itemBuilder: (ctx, index) {
            return Gardeningsetuplooks(
              id: products[index].documentID,
              imageurl: products[index]["imageurl"][0],
              title: products[index]["title"],
            );
          },
          itemCount: products.length,
        );
      },
    );
  }
}
