// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_firebase_flutter/pages/dropdown_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ModelSheet extends StatefulWidget {
  ModelSheet({Key? key, required this.btnname, required this.Colors})
      : super(key: key);
  String btnname;
  Color Colors;

  @override
  State<ModelSheet> createState() => _ModelSheetState();
}

class _ModelSheetState extends State<ModelSheet> {
  final Uri url = Uri.parse('tel:+917838908606');
  final _formkey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  TextEditingController _LocationController = TextEditingController();
  TextEditingController _NameController = TextEditingController();
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _MobileNumberController = TextEditingController();
  TextEditingController _DescriptionController = TextEditingController();
  TextEditingController _ReviewController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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

  final user = FirebaseAuth.instance.currentUser;

  Future addUserDetails(String Name, int MobileNumber, String Location,
      String email, String Date) async {
    try {
      await FirebaseFirestore.instance.collection('enquiryIOS').add({
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
    return GestureDetector(
        onTap: () {
          displayBottomsheet(context);
        },
        child: Text(
          widget.btnname,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 14, color: widget.Colors,),
        ));
    //   TextButton(
    //   style: ElevatedButton.styleFrom(
    //       backgroundColor: Color(0xFFfb4d00),
    //       foregroundColor: Colors.white,
    //     elevation: 5,
    //   ),
    //   onPressed: () {
    //     displayBottomsheet(context);
    //   },
    //   child: Text(widget.btnname,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
    // );
  }

  Future displayBottomsheet(BuildContext context) {
    return showModalBottomSheet(
        enableDrag: true,
        isScrollControlled: true,
        context: context,
        builder: (context) => SafeArea(
          child: Container(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height-40,
                    maxHeight: MediaQuery.of(context).size.height * 10),
                child: Form(
                  key: _formkey,
                  child: ListView(shrinkWrap: true, children: [
                    // name textfield
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "I want to go for a Yatra in/around",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.grey[600]),
                        ),
                        Text(
                          "*",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Color(0xFFfb4d00)),
                        ),
                        SizedBox(width: 70,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFfb4d00)
                          ),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "CLOSE",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,decoration: TextDecoration.underline,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.grey[200],
                          border: Border.all(color: Colors.grey.shade500, width: 1),
                          // borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Location cannot be empty";
                              }
                              return null;
                            },
                            controller: _LocationController,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.location_on_outlined,
                                color: Color(0xFFfb4d00),
                              ),
                              border: InputBorder.none,
                              hintText:
                                  ' Example - Badrinath,Gangotri,Kedarnath',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Full Name",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.grey[600]),
                        ),
                        Text(
                          "*",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Color(0xFFfb4d00)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade500,width: 1),
                          // borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Username cannot be empty";
                              }
                              return null;
                            },
                            controller: _NameController,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person_outline_outlined,
                                color: Color(0xFFfb4d00),
                              ),
                              border: InputBorder.none,
                              hintText: 'Name ',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Email Address",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.grey[600]),
                        ),
                        Text(
                          "*",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Color(0xFFfb4d00)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade500,
                          ),
                          // borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "email cannot be empty";
                              }
                              return null;
                            },
                            controller: _EmailController,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.mail_outlined,
                                color: Color(0xFFfb4d00),
                              ),
                              border: InputBorder.none,
                              hintText: 'Email ',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Mobile Number",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.grey[600]),
                        ),
                        Text(
                          "*",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Color(0xFFfb4d00)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade500,
                          ),
                          // borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Mobile Number';
                              }
                              return null;
                            },
                            controller: _MobileNumberController,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.phone_outlined,
                                color: Color(0xFFfb4d00),
                              ),
                              border: InputBorder.none,
                              hintText: 'Mobile Number  ',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: <Widget>[
                              // SizedBox(
                              //   height: 23,
                              // ),
                              Container(
                                child: Text(
                                  "Date of Travel",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                      color: Colors.grey[600]),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                  width: 176,
                                  height: 47,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.shade500, width: 1),
                                    // borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2023),
                                            lastDate: DateTime(2030),
                                          ).then((pickedDate) {
                                            if (pickedDate == null) {
                                              return 'choose  date';
                                            } else {
                                              setState(() {
                                                _selectedDate = pickedDate;
                                              });
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          Icons.calendar_month,
                                          color: Color(0xFFfb4d00),
                                          size: 24,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: Text(
                                          _selectedDate == null
                                              ? "Select date"
                                              : '${DateFormat.yMd().format(_selectedDate!)}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              // SizedBox(
                              //   height: 20,
                              // ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "No of People",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17,
                                        color: Colors.grey[600]),
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17,
                                        color: Color(0xFFfb4d00)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              DropdownView(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Aditional Information",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade500, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextFormField(
                              maxLines: 3,
                              decoration: InputDecoration(
                                hintText:
                                    'Write a description of your Yatra so we can design the best package for you!',
                                border: InputBorder.none,
                              ),
                              controller: _ReviewController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Location cannot be empty";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 4,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0),
                              child: Text(
                                  "We assure the privacy of your contzact data."),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0),
                              child: Text(
                                  "This data will only be used by our team to contact you"),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xFFfb4d00),
                              foregroundColor: Colors.white),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              addUserDetails(
                                  _NameController.text.trim(),
                                  int.parse(
                                      _MobileNumberController.text.trim()),
                                  _LocationController.text.trim(),
                                  _EmailController.text.trim(),
                                  _selectedDate.toString().trim());
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                          child: Text('SUBMIT QUERY')),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Stack(children: [
                      Container(
                        height: 30,
                        child: Divider(
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                          color: Colors.grey[400],
                        ),
                      ),
                      Positioned(
                          left: MediaQuery.of(context).size.width / 2,
                          // bottom: 0,
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                // shape: BoxShape.circle,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(child: Text("or")),
                          ))
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        width: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color(0xFFfb4d00),
                            )),
                        child: GestureDetector(
                          onTap: ()async {
                            // FlutterPhoneDirectCaller.callNumber('917838908606');
                            // launch('tel : 917838908606');

                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              print('cannot launch this url');
                            }
                          },
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                color: Color(0xFFfb4d00),
                                height: 40,
                                width: 160,
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                height: 40,
                                width:200,
                                child: GestureDetector(
                                    child: Center(
                                        child: Text(
                                  "+91-7838-908-606",
                                  style: TextStyle(
                                      color: Color(0xFFfb4d00), fontSize: 17),
                                ))),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     GestureDetector(
                    //         onTap: (){
                    //
                    //         },
                    //         child: Text("Scroll To Top")),
                    //   ],
                    // )
                  ]),
                ),
              ),
        ));
  }
}
