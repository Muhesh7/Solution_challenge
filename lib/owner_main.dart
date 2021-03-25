import 'package:Millichange/screen/employee_details.dart';
import 'package:Millichange/screen/ordersList.dart';
import 'package:Millichange/screen/orders_screen.dart';
import 'package:Millichange/screen/transList.dart';

import './auth/auth_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import './providers/Order.dart';
import './providers/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(OwnerApp());
}

class OwnerApp extends StatefulWidget {
  @override
  _OwnerAppState createState() => _OwnerAppState();
}

class _OwnerAppState extends State<OwnerApp> {
  final Auth auth = Auth();
  bool isLoggedin = true;

  @override
  void initState() {
    auth.autoLogin().then(
      (value) {
        print(value);
        if (value == 'null') {
          setState(
            () {
              isLoggedin = false;
            },
          );
        } else {
          setState(
            () {
              isLoggedin = true;
            },
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isLoggedin ? Home() : Authscreen(),
        routes: {
          Authscreen.route: (ctx) => Authscreen(),
          Home.route: (ctx) => Home(),
          OrderDetailscreen.route: (ctx) => OrderDetailscreen(),
          TransDetailscreen.route: (ctx) => TransDetailscreen()
        },
      ),
    );
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _children = [OrdersList(), TransList()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text("MilliChange"), backgroundColor: Colors.green),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black54,
          showUnselectedLabels: false,
          backgroundColor: Colors.green, // new
          currentIndex:
              _currentIndex, // new// this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.home), label: "Orders"),
            BottomNavigationBarItem(
                icon: new Icon(Icons.list_alt), label: "Employees")
          ],
        ));
  }
}

class Home extends StatefulWidget {
  static const route = "./ownerscreen";
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}
