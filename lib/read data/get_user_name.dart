// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_firebase_flutter/PackagePage/pakage_page.dart';
import 'package:travel_firebase_flutter/pages/modelsheet.dart';
import 'package:travel_firebase_flutter/pages/search_page.dart';

class GetUserName extends StatefulWidget {
  const GetUserName({Key? key, required this.documentId}) : super(key: key);

  final String documentId;

  @override
  State<GetUserName> createState() => _GetUserNameState();
}

class _GetUserNameState extends State<GetUserName> {
  @override
  Widget build(BuildContext context) {
    //get the collection
    CollectionReference package =
        FirebaseFirestore.instance.collection('package');
    return FutureBuilder<DocumentSnapshot>(
        future: package.doc(widget.documentId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            if(data['daysList'].isEmpty) {
              print(data['name']);
            }
            return Container(
              child: Center(
                child: Column(
                  children: [
                    Card(
                      semanticContainer: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: SizedBox(
                        height: 130,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 2),
                                        blurRadius: 6),
                                  ]),
                              child: Stack(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width/2.7,
                                    height: 130,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomLeft: Radius.circular(15)),
                                      child: Image.network(
                                        (data['banner']),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 7,
                                      right: 4,
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFfb4d00),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5)),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
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
                                                    data['days'],
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5)),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.nightlight,
                                                      size: 16),
                                                  Text(
                                                    data['nights'],
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/1.9,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    child: Text(
                                      data['name'].toString(),
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),

                                      Column(
                                        children: [
                                          travelicon(data['viewType']),
                                        ],
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
                                      SizedBox(width: 10,)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 103,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFfb4d00),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 5,
                                            ),

                                            data['daysList'].isEmpty ? ModelSheet(btnname: "Enquire now", Colors: Colors.white) :
                                                GestureDetector(
                                                    onTap: (){
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (_) => PackagePage(
                                                                datafromuser: data,
                                                              ))
                                                      );
                                                    },
                                                    child: Text("View details",style:TextStyle( fontWeight: FontWeight.w500, fontSize: 14,color: Colors.white),)),

                                            Icon(
                                              Icons.arrow_right_outlined,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children : [
                                          Text(
                                            data['mrp'],
                                            style: TextStyle(
                                              fontSize: 12,
                                                fontWeight:
                                                    FontWeight.w500,
                                                color: Colors.grey[500],
                                                decoration: TextDecoration
                                                    .lineThrough),
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.currency_rupee,
                                                    size: 18,
                                                    color: Colors.black,
                                                  ),
                                                  Text(
                                                    data['discountedPrice'].toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14),
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          // edhr loading vala layout bnana h
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Card(
                      semanticContainer: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: SizedBox(
                        height: 150,
                        width: 550,

                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  travelicon(viewtype){
    if(viewtype == 1){
     return
      Column(
                  children: [
                    // Icon(Icons.car_rental,size: 25,),
                    Image.asset(
                      "assets/icons/car.png",
                      height: 20,
                      width: 20,
                      fit: BoxFit.fill,
                    ),
                    Text('Car')
                  ],
                );
    }
    else if(viewtype == 2){
      return
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
                );
    }
    else if(viewtype == 3){
      return
      Column(
                  children: [
                    Image.asset(
                      "assets/icons/ic_bus.png",
                      height: 20,
                      width: 20,
                      fit: BoxFit.fill,
                    ),
                    Text('Bus')
                  ],
                );
    }
    else if(viewtype == 4){
      return
      Column(
                  children: [
                    Image.asset(
                      "assets/icons/ic_train.png",
                      height: 20,
                      width: 20,
                      fit: BoxFit.fill,
                    ),
                    Text('Train')
                  ],
                );
    }
  }
}
// Text('Last Name : ${data['last name']}',

//
// Column(
// children: [
// SizedBox(
// height: 130,
// width: 150,
// child: Image.network(
// data['imageurl'],
// fit: BoxFit.fill,
// ),
// ),
// ],
// ),


// Navigator.push(
//      context,
//      MaterialPageRoute(
//          builder: (_) => PackagePage(
//                datafromuser: data,
//              )));