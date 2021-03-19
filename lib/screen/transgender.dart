import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../main.dart';

import '../screen/commonapp_drawer.dart';

import '../providers/Order.dart';


class Confirmation extends StatelessWidget {
  static const route = "./Confirmation";
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AlertDialog(
          content: Text("Are you a trangender ?"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(Transgenderscreen.route);
                },
                child: Text('Yes')),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No')),
          ],
        ),
      ),
    );
  }
}

class Transgenderscreen extends StatefulWidget {
  static const route = "./Trangenderscreen";
  @override
  _TransgenderscreenState createState() => _TransgenderscreenState();
}

class _TransgenderscreenState extends State<Transgenderscreen> {
  final form = GlobalKey<FormState>();
  TextEditingController name;
  TextEditingController phoneno;
  TextEditingController address;
  TextEditingController district;
  TextEditingController pin;
  TextEditingController age;
  TextEditingController qualification;
  TextEditingController schoolname;
  TextEditingController collegename;
  TextEditingController parent;

  final namenode = FocusNode();
  final phonenode = FocusNode();
  final addressnode = FocusNode();
  final districtnode = FocusNode();
  final pinnode = FocusNode();
  final agenode = FocusNode();
  final qualificationnode = FocusNode();
  final schoolnode = FocusNode();
  final collegenode = FocusNode();
  final parentnode = FocusNode();


  var details = TransgenderForm(
    name: "",
    address: "",
    district: "",
    phoneno: null,
    pin: null,
    age: null,
    collegename: "",
    schoolname: "",
    qualification: "",
  );

  var isloading = false;

  DateTime selectedDate;
  DateTime initial = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: initial,
        firstDate: DateTime(1970),
        lastDate: DateTime(2050));
    setState(() {
      selectedDate = pickedDate;
    });
  }

  Future<void> finaldetails(BuildContext ctx) async {
    final isvalid = form.currentState.validate();
    if (!isvalid) {
      return;
    } else if (selectedDate == null || selectedDate.toString().isEmpty) {
      return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          content: Text("Enter the D.O.B"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('okay')),
          ],
        ),
      );
    } else {
      form.currentState.save();
      setState(() {
        isloading = true;
      });
      try {
        await Provider.of<Orders>(context, listen: false)
            .formdetails(details, selectedDate);
      } catch (error) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('error occured'),
            content: Text(error),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('okay')),
            ],
          ),
        );
      }
    }
    setState(() {
      isloading = false;
    });
    showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          content: Text('Your application has been registered'),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed(Firstscreen.route);
                },
                child: Text('ok'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Welfare For Transgender"),
        backgroundColor: Colors.green,
      ),
      drawer: CommonAppdrawer(),
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Form(
                key: form,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(17),
                        
                        width: size.width * 0.9,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green)),
                        child: TextFormField(
                          controller: name,
                          focusNode: namenode,
                          onFieldSubmitted: (_){
                            FocusScope.of(context).requestFocus(phonenode);
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Your Name"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "enter the name";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            details = TransgenderForm(
                              address: details.address,
                              district: details.district,
                              name: value,
                              phoneno: details.phoneno,
                              pin: details.pin,
                              age: details.age,
                              collegename: details.collegename,
                              dob: details.dob,
                              qualification: details.qualification,
                              schoolname: details.schoolname,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(17),
                        width: size.width * 0.9,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green)),
                        child: TextFormField(
                          controller: phoneno,
                          focusNode: phonenode,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Your Phone Number"),
                               onFieldSubmitted: (_){
                            FocusScope.of(context).requestFocus(parentnode);
                          },
                          validator: (value) {
                            if (value.length != 10) {
                              return "enter the phone number";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            details = TransgenderForm(
                              address: details.address,
                              district: details.district,
                              name: details.name,
                              phoneno: int.parse(value),
                              pin: details.pin,
                              age: details.age,
                              collegename: details.collegename,
                              dob: details.dob,
                              qualification: details.qualification,
                              schoolname: details.schoolname,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(17),
                          child: Container(
                            width: size.width * 0.35,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.green)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                selectedDate == null
                                    ? Text("D.O.B")
                                    : Text(DateFormat("MM-dd-yyyy")
                                        .format(selectedDate)),
                                IconButton(
                                    icon: Icon(Icons.arrow_drop_down),
                                    onPressed: () {
                                      _selectDate(context);
                                    })
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(17),
                          child: Container(
                            width: size.width * 0.35,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.green)),
                            child: TextFormField(
                              controller: age,
                              focusNode: agenode,
                               onFieldSubmitted: (_){
                            FocusScope.of(context).requestFocus(schoolnode);
                          },
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: "Age"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "enter the Age";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                details = TransgenderForm(
                                    address: details.address,
                                    district: details.district,
                                    name: details.name,
                                    phoneno: details.phoneno,
                                    pin: details.pin,
                                    collegename: details.collegename,
                                    schoolname: details.schoolname,
                                    age: int.parse(value));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(17),
                        width: size.width * 0.9,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green)),
                        child: TextFormField(
                          controller: schoolname,
                          focusNode: schoolnode,
                         onFieldSubmitted: (_){
                            FocusScope.of(context).requestFocus(collegenode);
                          },                     
                           decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "School Name(Optional)"),
                          onSaved: (value) {
                            details = TransgenderForm(
                              address: details.address,
                              district: details.district,
                              name: details.name,
                              phoneno: details.phoneno,
                              pin: details.pin,
                              age: details.age,
                              collegename: details.collegename,
                              qualification: details.qualification,
                              schoolname: details.schoolname,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(17),
                        width: size.width * 0.9,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green)),
                        child: TextFormField(
                          controller: collegename,
                          focusNode: collegenode,
                           onFieldSubmitted: (_){
                            FocusScope.of(context).requestFocus(qualificationnode);
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "College Name(optional)"),
                          onSaved: (value) {
                            details = TransgenderForm(
                                address: details.address,
                                district: details.district,
                                name: details.name,
                                phoneno: details.phoneno,
                                pin: details.pin,
                                age: details.age,
                                collegename: value,
                                schoolname: details.schoolname,
                                qualification: details.qualification);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(17),
                        width: size.width * 0.9,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green)),
                        child: TextFormField(
                          controller: qualification,
                          focusNode: qualificationnode,
                          onFieldSubmitted: (_){
                            FocusScope.of(context).requestFocus(addressnode);
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Qualification(optional)"),
                          onSaved: (value) {
                            details = TransgenderForm(
                              address: details.address,
                              district: details.district,
                              name: value,
                              phoneno: details.phoneno,
                              pin: details.pin,
                              age: details.age,
                              collegename: details.collegename,
                              qualification: value,
                              schoolname: details.schoolname,
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(17),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: size.width * 0.6,
                          height: size.height * 0.2,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green)),
                          child: TextFormField(
                            controller: address,
                            maxLines: 7,
                            focusNode: addressnode,
                            onFieldSubmitted: (_){
                            FocusScope.of(context).requestFocus(pinnode);
                          },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter The Address"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'enter the address';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              details = TransgenderForm(
                                address: value,
                                district: details.district,
                                name: details.name,
                                phoneno: details.phoneno,
                                pin: details.pin,
                                age: details.age,
                                collegename: details.collegename,
                                qualification: details.qualification,
                                schoolname: details.schoolname,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(17),
                          child: Container(
                            width: size.width * 0.35,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.green)),
                            child: TextFormField(
                              controller: pin,
                              focusNode: pinnode,
                              onFieldSubmitted: (_){
                            FocusScope.of(context).requestFocus(districtnode);
                          },
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: "Pin No"),
                              validator: (value) {
                                if (value.length != 6) {
                                  return "enter the Pin No";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                details = TransgenderForm(
                                  address: details.address,
                                  district: details.district,
                                  name: details.name,
                                  phoneno: details.phoneno,
                                  pin: int.parse(value),
                                  age: details.age,
                                  collegename: details.collegename,
                                  qualification: details.qualification,
                                  schoolname: details.schoolname,
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(17),
                          child: Container(
                            width: size.width * 0.35,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.green)),
                            child: TextFormField(
                              controller: district,
                              focusNode: districtnode,
                              onFieldSubmitted: (_){
                            FocusScope.of(context).unfocus();
                          },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "District"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "enter the district";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                details = TransgenderForm(
                                  address: details.address,
                                  district: value,
                                  name: details.name,
                                  phoneno: details.phoneno,
                                  pin: details.pin,
                                  age: details.age,
                                  collegename: details.collegename,
                                  dob: details.dob,
                                  qualification: details.qualification,
                                  schoolname: details.schoolname,
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 17),
                    RaisedButton(
                      onPressed: () {
                        finaldetails(context);
                      },
                      child: Text(
                        "Submit",
                      ),
                      color: Colors.green,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
