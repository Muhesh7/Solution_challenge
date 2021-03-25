import 'package:Millichange/looks/transdetails_look.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("transgender").snapshots(),
      builder: (ctx, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final transDetails = snap.data.documents;
        return ListView.builder(
          itemCount: transDetails.length,
          itemBuilder: (ctx, index) {
            return TransDetailsLook(
                id: transDetails[index].documentID,
                name: transDetails[index]["name"],
                address: transDetails[index]["address"],
                district: transDetails[index]["district"]);
          },
        );
      },
    );
  }
}
