import 'package:flutter/material.dart';
import '../screen/app_drawer.dart';
import '../screen/search_screen.dart';

import '../widgets/product_overview.dart';

class Potsscreen extends StatefulWidget {
  static const route = "potsscreen";
  @override
  _PotsscreenState createState() => _PotsscreenState();
}

class _PotsscreenState extends State<Potsscreen> {
  TextEditingController search = TextEditingController();
  String searching;

  void didChangeDependencies() {
    final searchquery = ModalRoute.of(context).settings.arguments as String;
    search.text = searchquery;
    searching = searchquery;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);
    final h1 = MediaQuery.of(context).size.height - height;
    print(h1);
    print(height);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          height: h1 - 20,
          child: TextField(
            controller: search,
            onChanged: (value) {
              setState(() {
                searching = value;
              });
            },
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
              hintText: "...search pots",
              hintStyle: TextStyle(fontSize: 20),
            ),
            keyboardType: TextInputType.text,
          ),
        ),
      ),
      body: searching == null || searching.isEmpty
          ? Productoverview()
          : Searchscreen(searching),
      drawer: Appdrawer(),
    );
  }
}
