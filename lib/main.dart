import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import './providers/Order.dart';
import './providers/auth.dart';
import './providers/seed.dart';
import './providers/filter.dart';

import './screen/gardeningsetup_screen.dart';
import './screen/gardeningtools_screen.dart';
import './screen/indoor_screen.dart';
import './screen/readmore.dart';
import './screen/seed_details.dart';
import './screen/selfwatering_pots.dart';
import './screen/setupprice_screen.dart';
import './screen/soil_screen.dart';
import './screen/transgender.dart';
import './screen/seed_screen.dart';
import './screen/deleiverydetails_screen.dart';
import './screen/ordering_screen.dart';
import './screen/searchview_screen.dart';
import './screen/pots_screen.dart';
import './screen/filter_screen.dart';

import './auth/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          create: (context) => Filter(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
        ChangeNotifierProvider(
          create: (context) => Seed(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isLoggedin ? Firstscreen() : Authscreen(),
        routes: {
          Authscreen.route: (ctx) => Authscreen(),
          Firstscreen.route: (ctx) => Firstscreen(),
          Searchviewscreen.route: (ctx) => Searchviewscreen(),
          Potsscreen.route: (ctx) => Potsscreen(),
          Filterscreen.route: (ctx) => Filterscreen(),
          Orderingscreen.route: (ctx) => Orderingscreen(),
          Deleiverydetailsscreen.route: (ctx) => Deleiverydetailsscreen(),
          Seedscreen.route: (ctx) => Seedscreen(),
          Gardeningtoolsscreen.route: (ctx) => Gardeningtoolsscreen(),
          Gardeningsetup.route: (ctx) => Gardeningsetup(),
          Setuppricescreen.route: (ctx) => Setuppricescreen(),
          Readmore.route: (ctx) => Readmore(),
          Soilscreen.route: (ctx) => Soilscreen(),
          Seeddetails.route: (ctx) => Seeddetails(),
          Indoorscreen.route: (ctx) => Indoorscreen(),
          Selfwateringscreen.route: (ctx) => Selfwateringscreen(),
          Transgenderscreen.route: (ctx) => Transgenderscreen(),
          Confirmation.route: (ctx) => Confirmation(),
        },
      ),
    );
  }
}

class Firstscreen extends StatelessWidget {
  static const route = "./firstscreen";

  final List<String> category = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvrbPVD5ptnGUdMbBeuXMnxpyZ5aSifrjHJA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM_HV8xSJhqyVIs8QE49IdaCW1-oLw61m0o-xzgsSFbcWRDKnl23XglRoI9Q&usqp=CAc",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwVdPO4MqZPGAgGsDyYxwfsJKbDyH4DSg2ShxfM5-e3JcEUxYlqA7fPGO6vz4&usqp=CAc",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHeZQvvHUM7eHbLkMria3RtGZXonrNNMW5nw&usqp=CAU",
    "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSvc5V8rU2SqoRgrOnoPkC5r258SaCUdG-YhK3uhdtFGov8uUG1FTMrB8Zt-USpTP33YtAui6HlIAfzGQWztdINeeKWZzjLMD9wIN-qPprW&usqp=CAc",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR906EBexZV8MIU-YOU-CvrOYUQ0Vk3_nQS3w&usqp=CAU",
    "https://pinoyhousedesigns.com/wp-content/uploads/2017/10/FEA-IMA.jpg",
    "https://i0.wp.com/racolblegal.com/wp-content/uploads/2016/03/Equal-Right-min.jpg?resize=768%2C443&ssl=1",
  ];

  final List<String> categoryname = [
    "Seeds",
    "Indoor And Live Plants",
    "Self Watering Plants",
    "Fancy Pots",
    "Gardening Tools",
    "Soil And Fertilizers",
    "Gardening setup",
    "Welfare For Transgender",
  ];

  final List<String> routes = [
    Seedscreen.route,
    Indoorscreen.route,
    Selfwateringscreen.route,
    Potsscreen.route,
    Gardeningtoolsscreen.route,
    Soilscreen.route,
    Gardeningsetup.route,
    Confirmation.route,
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
              child: Image.asset(
                "assets/final.png",
              ),
              height: size.height * 0.1),
          Container(
            padding: EdgeInsets.all(18),
            height: size.height * 0.87,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4.5 / 6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(routes[index]);
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                        ),
                        height: size.height * 0.2,
                        width: size.width * 1,
                        child: Image.network(
                          category[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        child: Text(
                          categoryname[index],
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}
