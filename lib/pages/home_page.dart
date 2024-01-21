// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formkey = GlobalKey<FormState>();
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

  List<IconData> _icons = [
    Icons.airplanemode_active,
    Icons.bed,
    Icons.paragliding,
    Icons.electric_bike
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).hintColor
              : const Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          _icons[index],
          size: 25,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : const Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  final user = FirebaseAuth.instance.currentUser!;

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
      appBar: AppBar(
        title: Text(user.email!),
        actions: [
          GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Icon(
                Icons.exit_to_app,
                color: Colors.blueGrey,
              )),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 120,
                  ),
                  child: Text(
                    'What you would like to find?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _icons
                      .asMap()
                      .entries
                      .map(
                        (e) => _buildIcon(e.key),
                      )
                      .toList(),
                ),
              ],
            ),
            BottomSheet(context)
          ],
        ),
      ),
    );
  }

  Column BottomSheet(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => Container(
                        child: SingleChildScrollView(
                          child: SafeArea(
                            child: Form(
                              key: _formkey,
                              child: Column(children: [
                                // name textfield
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      "I want to go for a Yatra in/around..",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return "Location cannot be empty";
                                          }
                                          return null;
                                        },
                                        controller: _LocationController,
                                        decoration: InputDecoration(
                                          icon: Icon(Icons.location_on),
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

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
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
                                          icon: Icon(Icons.person),
                                          border: InputBorder.none,
                                          hintText: 'Name ',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        autocorrect: false,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "email cannot be empty";
                                          }
                                          return null;
                                        },
                                        controller: _EmailController,
                                        decoration: InputDecoration(
                                          icon: Icon(Icons.mail),
                                          border: InputBorder.none,
                                          hintText: 'Email ',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
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
                                          icon: Icon(Icons.phone),
                                          border: InputBorder.none,
                                          hintText: 'Mobile Number  ',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Container(
                                    height: 80,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: Text(_selectedDate == null
                                                ? 'No Date Chosen!'
                                                : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}')),
                                        Text(
                                          'choose Date',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2023),
                                              lastDate: DateTime.now(),
                                            ).then((pickedDate) {
                                              if (pickedDate == null) {
                                                return 'choose  date';
                                              }
                                              setState(() {
                                                _selectedDate = pickedDate;
                                              });
                                            });
                                          },
                                          icon: Icon(
                                            Icons.calendar_month,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()) {
                                        addUserDetails(
                                            _NameController.text.trim(),
                                            int.parse(_MobileNumberController
                                                .text
                                                .trim()),
                                            _LocationController.text.trim(),
                                            _EmailController.text.trim(),
                                            _selectedDate.toString().trim());
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text('Processing Data')),
                                        );
                                      }
                                    },
                                    child: Text('Send Query')),
                              ]),
                            ),
                          ),
                        ),
                      ));
            },
            child: Text("Plain Your Yatra"))
      ],
    );
  }
}
