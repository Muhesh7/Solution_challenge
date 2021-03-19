import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../looks/product_look.dart';

import '../providers/filter.dart';

class Productoverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final price = Provider.of<Filter>(context).htol;
    final size = Provider.of<Filter>(context).finalsize;
    final type = Provider.of<Filter>(context).finalpottype;
    List<List<String>> data = [];
    for (int i = 0; i < size.length; i++) {
      data.add([size[i], type]);
    }
    return StreamBuilder(
      stream: (size == null || size.isEmpty) && (type == null || type.isEmpty)
          ? FirebaseFirestore.instance
              .collection("products")
              .orderBy("price", descending: price)
              .snapshots()
          : (size != null) && (type == null || type.isEmpty)
              ? FirebaseFirestore.instance
                  .collection("products")
                  .where("size", arrayContainsAny: size)
                  .orderBy("price", descending: price)
                  .snapshots()
              : (size == null || size.isEmpty) &&
                      (type != null || type.isNotEmpty)
                  ? FirebaseFirestore.instance
                      .collection("products")
                      .orderBy("price", descending: price)
                      .where("subtitle", isEqualTo: type)
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection("products")
                      .where("size", whereIn: data)
                      .orderBy("price", descending: price)
                      .snapshots(),
      builder: (ctx, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final products = snap.data.documents;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: products.length,
          itemBuilder: (ctx, index) {
            return Productlook(
                key: key,
                title: products[index]["title"],
                imageurl: products[index]['imageurl'][0],
                price: products[index]["price"],
                id: products[index].documentID,
                subtitle: products[index]["subtitle"]);
          },
        );
      },
    );
  }
}
