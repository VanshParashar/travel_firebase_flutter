// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_firebase_flutter/HomePage/destinationhotelsview.dart';
import 'package:travel_firebase_flutter/HomePage/heli_view.dart';
import 'package:travel_firebase_flutter/HomePage/homepackageview.dart';
import 'package:travel_firebase_flutter/HomePage/slider.dart';
import 'package:travel_firebase_flutter/HomePage/trendingdestination.dart';
import 'package:travel_firebase_flutter/pages/modelsheet.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri url = Uri.parse('tel:+917838908606');

  int _selectedIndex = 0;
  DateTime? _selectedDate;
  TextEditingController _LocationController = TextEditingController();
  TextEditingController _NameController = TextEditingController();
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _MobileNumberController = TextEditingController();
  TextEditingController _DescriptionController = TextEditingController();

  @override
  void dispose() {
    _NameController.dispose();
    _LocationController.dispose();
    _EmailController.dispose();
    _MobileNumberController.dispose();
    _DescriptionController.dispose();
    super.dispose();
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  Future addUserDetails(String Name, int MobileNumber, String Location,
      String email, String Date) async {
    try {
      await FirebaseFirestore.instance.collection('enquiryForm').add({
        'name': Name,
        'Mobile Number': MobileNumber,
        'Location': Location,
        'email': email,
        'date': Date,
      });
    } on FirebaseAuthException catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SliderView(),
              TrendingDestinationView(),
              SizedBox(
                height: 20,
              ),
              HomePackageView(packname: 'Chardham Packages',pcknumber: 1),
              // SizedBox(height: 10,),
              Card(
                elevation: 0,
                margin: EdgeInsets.all(10),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/outstation_car_rental.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              HeliView(),
              Card(
                elevation: 0,
                margin: EdgeInsets.all(10),
                child: Container(
                    height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/outstation_car_rental.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              HomePackageView(packname: "Uttarakhand Packages",pcknumber: 3),
              SizedBox(
                height: 20,
              ),
              DestinationHotelsView(),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 160,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.all(10),
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 20, right: 10, bottom: 20),
                        child: Image.asset(
                          "assets/images/help.webp",
                          height:MediaQuery.of(context).size.width/4,
                          width: MediaQuery.of(context).size.width/4,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text("Need Yatra Expert\'s Help?"),
                          Text("Are you interested in planning \n a Yatra now?"),
                          Text("It takes only 2 minutes!"),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.black),
                                  onPressed: () async {
                                    //To remove the keyboard when button is pressed
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    var whatsappUrl =
                                        "whatsapp://send?phone=${917838908606}" +
                                            "&text=${Uri.encodeComponent("hi there testing ")}";
                                    try {
                                      launch(whatsappUrl);
                                    } catch (e) {
                                      //To handle error and display error message
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icons/whatsapp_icon.png",
                                        height: 13,
                                        width: 13,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text("WhatsApp")
                                    ],
                                  )),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.black),
                                  onPressed: () async {
                                    // FlutterPhoneDirectCaller.callNumber('917838908606');
                                    // launch('tel : 917838908606');

                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    } else {
                                      print('cannot launch this url');
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icons/phone_icon.png",
                                        height: 10,
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text("Phone")
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.width*1.1,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 10, bottom: 10),
                      child: Text(
                        "Book your trip on Chardham Tour",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width*.40,
                                width: MediaQuery.of(context).size.width*.40,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assets/images/cus300.png",
                                    height: MediaQuery.of(context).size.width*.40,
                                    width: MediaQuery.of(context).size.width*.40,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                  left: -3,
                                  bottom: 0,
                                  child: Text(
                                    '''            24/7 Customer
                 Support''',
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width*.40,
                                width: MediaQuery.of(context).size.width*.40,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assets/images/cus2.png",
                                    height: MediaQuery.of(context).size.width*.40,
                                    width: MediaQuery.of(context).size.width*.40,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                  left: -3,
                                  bottom: 0,
                                  child: Text(
                                    '''             Best Price
             Guarantee''',
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width*.40,
                                width: MediaQuery.of(context).size.width*.40,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assets/images/cus3.png",
                                    height: MediaQuery.of(context).size.width*.40,
                                    width: MediaQuery.of(context).size.width*.40,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                  left: -3,
                                  bottom: 0,
                                  child: Text(
                                    '''           Multi-Payment
                  Options''',
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width*.40,
                                width: MediaQuery.of(context).size.width*.40,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assets/images/cus4people.png",
                                    height: MediaQuery.of(context).size.width*.40,
                                    width: MediaQuery.of(context).size.width*.40,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                  left: -3,
                                  bottom: 0,
                                  child: Text(
                                    '''              40K+ Happy
               Customers''',
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          height: 60,
          color: Color(0xFFAFD4E5FF),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width/1.27,
                  decoration: BoxDecoration(
                    color: Color(0xFFfb4d00),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  margin: EdgeInsets.only(left: 10),
                  child: Center(child: ModelSheet(btnname: "Plan Your Yatra",Colors: Colors.white,))),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width/7,
                child: IconButton(
                    padding: EdgeInsets.all(0.0),
                    style: ElevatedButton.styleFrom(
                        elevation: 0, backgroundColor: Color(0xFFAFD4E5FF)),
                    onPressed: () async {
                      //To remove the keyboard when button is pressed
                      FocusManager.instance.primaryFocus?.unfocus();

                      var whatsappUrl = "whatsapp://send?phone=${917838908606}" +
                          "&text=${Uri.encodeComponent("hi there testing ")}";
                      try {
                        launch(whatsappUrl);
                      } catch (e) {
                        //To handle error and display error message
                      }
                    },
                    icon: Image.asset(
                      "assets/icons/whatsapp.png",
                      width: MediaQuery.of(context).size.width/7,
                    )),
              )
            ],
          )),
    );
  }
}
