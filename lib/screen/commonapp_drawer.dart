import 'package:flutter/material.dart';

import '../providers/auth.dart';

import '../auth/auth_screen.dart';

import '../main.dart';

class CommonAppdrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Auth auth = Auth();
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 15),
          Container(
            child: Image.asset("assets/final.png"),
            height: size.height * 0.15,
          ),
          SizedBox(height: 20),
          Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: FlatButton.icon(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Firstscreen.route);
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.green,
                ),
                label: Text(
                  "Home Screen",
                  style: TextStyle(color: Colors.green),
                ),
              )),
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child: FlatButton.icon(
              onPressed: () {
                auth.signOut();
                Navigator.of(context).pushReplacementNamed(Authscreen.route);
              },
              icon: Icon(
                Icons.logout,
                color: Colors.green,
              ),
              label: Text(
                "Sign Out",
                style: TextStyle(color: Colors.green),
              ),
            ),
          )
        ],
      ),
    );
  }
}
