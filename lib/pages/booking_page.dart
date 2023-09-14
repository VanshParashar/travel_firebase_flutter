// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  List<String> docIDs = [];

  //get doc ids
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('package').where((e) => e['discountedPrice'] > 2223000).get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
          docIDs.add(document.reference.id);
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    CollectionReference package =
    FirebaseFirestore.instance.collection('package');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFfb4d00),
        title: Center(
            child: Text(
          'CHAARDHAM BOOKING',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: getDocId(),
              builder: (context, snapshot) {
                return Container(
                  height: 250,
                  child: ListView.builder(scrollDirection: Axis.horizontal,
                      itemCount: docIDs.length,
                      itemBuilder: (context, index) {
                        return FutureBuilder<DocumentSnapshot>(
                            future: package.doc(docIDs[index]).get(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                Map<String, dynamic> data =
                                    snapshot.data!.data() as Map<String, dynamic>;
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 5,
                                  margin:
                                  EdgeInsets.only(left: 20, top: 8, right: 8, bottom: 8),
                                  child: Container(
                                    height: 250,
                                    width: 210,
                                    decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        Stack(children: [
                                          Container(
                                            height: 120,
                                            width: 210,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(15),
                                                  topLeft: Radius.circular(15)),
                                              child: Image.asset(
                                                "assets/images/gangotri.jpeg",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              left: 10,
                                              bottom: 10,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFfb4d00),
                                                      borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(5),
                                                          bottomLeft: Radius.circular(5)),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(3.0),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.sunny,
                                                            color: Colors.white,
                                                            size: 16,
                                                          ),
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Text(
                                                            '6 Days',
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.w600),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.only(
                                                          topRight: Radius.circular(5),
                                                          bottomRight: Radius.circular(5)),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.nightlight, size: 16),
                                                        Text(
                                                          '5 Nights',
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.w600),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ))
                                        ]),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              // SizedBox(
                                              //   width: 15,
                                              // ),
                                              Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/icons/ic_helicopter.png",
                                                    height: 20,
                                                    width: 20,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  Text('Heli')
                                                ],
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/icons/hotel.png",
                                                    height: 20,
                                                    width: 20,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  Text('Hotel')
                                                ],
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/icons/meal.png",
                                                    height: 20,
                                                    width: 20,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  Text('Lunch')
                                                ],
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/icons/binocular.png",
                                                    height: 20,
                                                    width: 20,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  Text('Visit')
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 8, right: 8),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 111,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFfb4d00),
                                                    borderRadius: BorderRadius.circular(10)),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'View Details',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 14,
                                                          color: Colors.white),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_right_outlined,
                                                      color: Colors.white,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.currency_rupee,
                                                        size: 16,
                                                        color: Colors.grey[500],
                                                      ),
                                                      Text(
                                                        '1190',
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w500,
                                                            color: Colors.grey[500],
                                                            decoration:
                                                            TextDecoration.lineThrough),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      // SizedBox(
                                                      //   width: 25,
                                                      // ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.currency_rupee,
                                                            size: 20,
                                                            color: Colors.black,
                                                          ),
                                                          Text(
                                                            '10000',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 17),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        'Per Person',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return Text('Loading');
                            });
                      }),
                );
              }),
        ],
      ),
    );
  }
}
