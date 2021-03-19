import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screen/readmore.dart';
import '../screen/setupprice_screen.dart';

class Gardeningsetuplooks extends StatelessWidget {
  final String id;
  final String title;
  final String imageurl;

  Gardeningsetuplooks({this.id, this.imageurl, this.title});

  final String url = 'tel:+911234567890';

  Future<void> callnow() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'call not possible';
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15),
          Row(
            children: [
              Container(
                height: size.height * 0.25,
                width: size.width * 0.3,
                child: Image.network(
                  imageurl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: size.width * 0.55,
                      child: Text(
                        title,
                        style:
                            TextStyle(fontSize: 22, color: Colors.green[900]),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: size.width * 0.55,
                    child: Text(
                      "Nursery private limited",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                      width: size.width * 0.55,
                      child: Text(
                        "Chennai",
                        style: TextStyle(fontSize: 16),
                      )),
                  SizedBox(height: 20),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(Readmore.route, arguments: id);
                      },
                      child: Text(
                        "Read More...",
                        style: TextStyle(color: Colors.red),
                      ))
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton.icon(
                color: Colors.green,
                onPressed: () async {
                  callnow();
                },
                icon: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                label:
                    Text("Call seller", style: TextStyle(color: Colors.white)),
              ),
              RaisedButton.icon(
                color: Colors.green,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(Setuppricescreen.route, arguments: id);
                },
                icon: Icon(
                  Icons.attach_money,
                  color: Colors.white,
                ),
                label: Text("Price Details",
                    style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
