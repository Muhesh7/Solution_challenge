import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Readmore extends StatefulWidget {
  static const route = "./Readmore";
  @override
  _ReadmoreState createState() => _ReadmoreState();
}

class _ReadmoreState extends State<Readmore> {
  int currentIndex = 0;
  String id;
  bool isinit = true;
  String title;
  String description;
  List<String> images = [];
  List<String> features = [];
  @override
  void didChangeDependencies() async {
    if (isinit == true) {
      final ids = ModalRoute.of(context).settings.arguments as String;
      id = ids;

      final data = await FirebaseFirestore.instance
          .collection("gardeningsetup")
          .doc(id)
          .get();
      final datas = data.data();

      final image = datas["imageurl"];

      title = datas["title"];

      description = datas["description"];

      final feature = datas["features"];

      for (int i = 0; i < image.length; i++) {
        setState(() {
          images.add(image[i]);
        });
      }
      for (int j = 0; j < feature.length; j++) {
        setState(() {
          features.add(feature[j]);
        });
      }
      isinit = false;
    }

    super.didChangeDependencies();
  }

  Widget feature(String text) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      alignment: Alignment.centerLeft,
      child: Text(
        "*" + "  " + text,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return title == null ||
            title.isEmpty ||
            description.isEmpty ||
            description == null
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 25),
                  CarouselSlider(
                    items: images.map(
                      (card) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.30,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                color: Colors.blueAccent,
                                child: Image.network(
                                  card,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      // pauseAutoPlayOnTouch: Duration(seconds: 10),
                      aspectRatio: 2.0,
                      onPageChanged: (int index, n) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20), 
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Features",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 17),
                      feature(features[0]),
                      SizedBox(height: 10),
                      feature(features[1]),
                      SizedBox(height: 10),
                      feature(features[2]),
                      SizedBox(height: 10),
                      feature(features[3]),
                      SizedBox(height: 10),
                      feature(features[4]),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Product Description",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 17),
                      Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            description,
                            style: TextStyle(fontSize: 18),
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
