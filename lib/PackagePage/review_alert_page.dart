// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_firebase_flutter/PackagePage/reviiew_page.dart';

class ReviewPage extends StatefulWidget {
  ReviewPage({
    Key? key,
    required this.datafromuser,
  }) : super(key: key);

  Map<String, dynamic> datafromuser;

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final _formkey = GlobalKey<FormState>();
  double? rating;

  TextEditingController _NameController = TextEditingController();
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _ReviewController = TextEditingController();


  @override
  void dispose() {
    _NameController.dispose();
    _EmailController.dispose();
    _ReviewController.dispose();
    super.dispose();
  }

  Future addUserDetails(String Name,String email,String Review,double Rating) async {
    try {
      await FirebaseFirestore.instance.collection('reviewIOS').add({
        'name': Name,
        'email': email,
        'review': Review,
        'rating': Rating,
      });
    } on FirebaseAuthException catch (error) {
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(10),
          child: Card(
            elevation: 5,
            color: Colors.white,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(widget.datafromuser['name']),
                          content: Container(
                            height: MediaQuery.of(context).size.height / 3,
                            child: Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: 'Enter Name here...',
                                          border: InputBorder.none,
                                        ),
                                        controller: _NameController,
                                        validator: (value) {
                                          if (value == null || value
                                              .trim()
                                              .isEmpty) {
                                            return "Name cannot be empty";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: 'Enter Email here...',
                                          border: InputBorder.none,
                                        ),
                                        controller: _EmailController,
                                        validator: (value) {
                                          if (value == null || value
                                              .trim()
                                              .isEmpty) {
                                            return "Email cannot be empty";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  // Text('rating ${rating}'),
                                  RatingBar.builder(
                                      minRating: 1,
                                      itemSize: 46,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 4),
                                      itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                      updateOnDrag: true,
                                      onRatingUpdate: (rating)=>setState(() {
                                        this.rating = rating;
                                      })),
                                  SingleChildScrollView(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: TextFormField(
                                          maxLines: 2,
                                          decoration: InputDecoration(
                                            hintText:
                                                'Enter your experience with chaardhaam ',
                                            border: InputBorder.none,
                                          ),
                                          controller: _ReviewController,
                                          validator: (value) {
                                            if (value == null || value
                                                .trim()
                                                .isEmpty) {
                                              return "cannot be empty";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  child: Text("CANCEL"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text("SUBMIT"),
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      addUserDetails(
                                        _NameController.text.trim(),
                                        _EmailController.text.trim(),
                                        _ReviewController.text.trim(),
                                        rating!
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Processing Data')),
                                      );
                                      Navigator.pop(context);
                                  }
                                  },
                                )
                              ],
                            )
                          ],
                        );
                      });
                },
                child: Text(
                  "Write a Review",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,color: Color(0xFFfb4d00)
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
