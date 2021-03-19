import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Order.dart';

import '../screen/ordering_screen.dart';

class Gardeningtoolslook extends StatefulWidget {
  final String title;
  final String imageurl;
  final int price;
  final String id;
  Gardeningtoolslook({this.imageurl, this.price, this.title, this.id});

  @override
  _GardeningtoolslookState createState() => _GardeningtoolslookState();
}

class _GardeningtoolslookState extends State<Gardeningtoolslook> {
  int quantity = 1;

  Future<void> buy(BuildContext ctx, String id) async {
    if (quantity == 0 || quantity.toString().isEmpty) {
      return showDialog(
        context: ctx,
        builder: (context) {
          return AlertDialog(
            title: Text('error'),
            content: Text('enter the quantity'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ok'))
            ],
          );
        },
      );
    } else {
      return showDialog(
        context: ctx,
        builder: (context) {
          return AlertDialog(
            title: Text('order'),
            content: Text('Do you want to continue shopping'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('yes'),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(Orderingscreen.route);
                  },
                  child: Text('no'))
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final order = Provider.of<Orders>(context);
    return Container(
      padding: EdgeInsets.all(17),
      child: Row(
        children: [
          Container(
            height: size.height * 0.18,
            width: size.width * 0.25,
            decoration: BoxDecoration(border: Border.all(color: Colors.green)),
            child: Image.network(
              widget.imageurl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Container(
                width: size.width * 0.6,
                child: Text(
                  widget.title,
                  maxLines: 2,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green)),
                      key: widget.key,
                      width: 110,
                      height: 30,
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                icon: Icon(
                                  Icons.horizontal_rule,
                                  size: 10,
                                ),
                                onPressed: () {
                                  if (quantity == 0) {
                                  } else {
                                    setState(() {
                                      quantity -= 1;
                                    });
                                  }
                                }),
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(quantity.toString())),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  size: 11,
                                ),
                                onPressed: () {
                                  setState(() {
                                    quantity += 1;
                                  });
                                }),
                          ),
                        ],
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Text(
                      "₹" + "" + widget.price.toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              RaisedButton(
                onPressed: () {
                  if (quantity.toString().isEmpty || quantity == 0) {
                    buy(context, widget.id);
                  } else {
                    buy(context, widget.id);
                    order.addtoorderpreview(
                        id: widget.id,
                        title: widget.title,
                        imageurl: widget.imageurl,
                        price: widget.price.toDouble(),
                        quantity: quantity);
                  }
                },
                color: Colors.green,
                child: Text(
                  "Buy Now",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 20)
            ],
          )
        ],
      ),
    );
  }
}
