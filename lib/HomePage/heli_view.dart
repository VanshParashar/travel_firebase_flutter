// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_firebase_flutter/pages/package_list_page.dart';

import '../PackagePage/pakage_page.dart';
import '../pages/modelsheet.dart';

class HeliView extends StatefulWidget {
  HeliView({Key? key}) : super(key: key);

  @override
  State<HeliView> createState() => _HeliViewState();
}

class _HeliViewState extends State<HeliView> {
  List<String> docIDs = [];

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('package')
        .where('viewType', isEqualTo: 2).orderBy("discountedPrice",descending: true)
        .get()
        .then(
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
    return Stack(
      children: [
        Container(  width: MediaQuery.of(context).size.width,
          height: 320,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/hom_bac4.jpg"),
              fit: BoxFit.fill,
            ),
          ),),
        Positioned(
            child: ClipRRect(
              // borderRadius: BorderRadius.circular(50),
                child: Image.asset("assets/images/overlay_pic.png",  height: 320,
                  width: MediaQuery.of(context).size.width,fit: BoxFit.cover,opacity: const AlwaysStoppedAnimation(.5),))
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 291,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Helicopter Packages",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        DefaultTabController.of(context).animateTo(1);
                      },
                      child: Text(
                        "[View All]",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              FutureBuilder(
                  future: getDocId(),
                  builder: (context, snapshot) {
                    return Container(
                      height: 250,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: docIDs.length,
                          itemBuilder: (context, index) {
                            return FutureBuilder<DocumentSnapshot>(
                                future: package.doc(docIDs[index]).get(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    Map<String, dynamic> data = snapshot.data!
                                        .data() as Map<String, dynamic>;
                                    return Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 5,
                                      margin: EdgeInsets.only(
                                          left: 20, top: 8, bottom: 8),
                                      child: Container(
                                        height: 250,
                                        width: 190,
                                        decoration: BoxDecoration(
                                            // borderRadius: BorderRadius.circular(20),
                                            ),
                                        child: Column(
                                          children: [
                                            Stack(children: [
                                              Container(
                                                height: 100,
                                                width: 190,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.only(
                                                      topRight: Radius.circular(15),
                                                      topLeft: Radius.circular(15)),
                                                  child: Image.network(
                                                    data['banner'],
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                  top: 10,
                                                  right: 10,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          color: Color(0xFFfb4d00),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(5),
                                                                  bottomLeft: Radius
                                                                      .circular(5)),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  3.0),
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
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(5),
                                                                  bottomRight:
                                                                      Radius
                                                                          .circular(
                                                                              5)),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Icon(Icons.nightlight,
                                                                size: 16),
                                                            Text(
                                                              data['nights'],
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color:
                                                                      Colors.black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
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
                                              padding: const EdgeInsets.symmetric(horizontal:10.0),
                                              child: Row(
                                                children: [
                                                  Expanded(child: Text(data['name'] ,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 15,fontWeight: FontWeight.w600),)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  // SizedBox(
                                                  //   width: 15,
                                                  // ),
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
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 3.0, top: 8, right: 2),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    width: 102,
                                                    decoration: BoxDecoration(
                                                        color: Color(0xFFfb4d00),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 1,
                                                        ),
                                                        data['daysList'].isEmpty
                                                            ? ModelSheet(
                                                                btnname:
                                                                    "Enquire now",
                                                                Colors:
                                                                    Colors.white)
                                                            : GestureDetector(
                                                                onTap: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (_) =>
                                                                              PackagePage(
                                                                                datafromuser:
                                                                                    data,
                                                                              )));
                                                                },
                                                                child: Text(
                                                                  "View details",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize: 14,
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                        Icon(
                                                          Icons
                                                              .arrow_right_outlined,
                                                          color: Colors.white,size: 20,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    children: [
                                                    Text(
                                                    data['mrp'],
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.grey[500],
                                                        fontSize: 12,
                                                        decoration:
                                                        TextDecoration.lineThrough),
                                                  ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.end,
                                                        children: [
                                                          // SizedBox(
                                                          //   width: 25,
                                                          // ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .currency_rupee,
                                                                size: 20,
                                                                color: Colors.black,
                                                              ),
                                                              Text(
                                                                data['discountedPrice']
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize: 15),
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
                                                  borderRadius:
                                                      BorderRadius.circular(15)),
                                              elevation: 3,
                                              child: SizedBox(
                                                height: 240,
                                                width: 200,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          }),
                    );
                  }),

              // Container(
              //   height: 250,
              //   child: ListView.builder(
              //       shrinkWrap: true,
              //       itemCount: 6,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return Card(
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(15),
              //           ),
              //           elevation: 5,
              //           margin:
              //               EdgeInsets.only(left: 20, top: 8, right: 8, bottom: 8),
              //           child: Container(
              //             height: 250,
              //             width: 210,
              //             decoration: BoxDecoration(
              //                 // borderRadius: BorderRadius.circular(20),
              //                 ),
              //             child: Column(
              //               children: [
              //                 Stack(children: [
              //                   Container(
              //                     height: 120,
              //                     width: 210,
              //                     child: ClipRRect(
              //                       borderRadius: BorderRadius.only(
              //                           topRight: Radius.circular(15),
              //                           topLeft: Radius.circular(15)),
              //                       child: Image.asset(
              //                         "assets/images/gangotri.jpeg",
              //                         fit: BoxFit.fill,
              //                       ),
              //                     ),
              //                   ),
              //                   Positioned(
              //                       left: 10,
              //                       bottom: 10,
              //                       child: Row(
              //                         children: [
              //                           Container(
              //                             decoration: BoxDecoration(
              //                               color: Color(0xFFfb4d00),
              //                               borderRadius: BorderRadius.only(
              //                                   topLeft: Radius.circular(5),
              //                                   bottomLeft: Radius.circular(5)),
              //                             ),
              //                             child: Padding(
              //                               padding: const EdgeInsets.all(3.0),
              //                               child: Row(
              //                                 children: [
              //                                   Icon(
              //                                     Icons.sunny,
              //                                     color: Colors.white,
              //                                     size: 16,
              //                                   ),
              //                                   SizedBox(
              //                                     width: 4,
              //                                   ),
              //                                   Text(
              //                                     '6 Days',
              //                                     style: TextStyle(
              //                                         fontSize: 10,
              //                                         color: Colors.white,
              //                                         fontWeight: FontWeight.w600),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ),
              //                           Container(
              //                             decoration: BoxDecoration(
              //                               color: Colors.white,
              //                               borderRadius: BorderRadius.only(
              //                                   topRight: Radius.circular(5),
              //                                   bottomRight: Radius.circular(5)),
              //                             ),
              //                             child: Row(
              //                               children: [
              //                                 Icon(Icons.nightlight, size: 16),
              //                                 Text(
              //                                   '5 Nights',
              //                                   style: TextStyle(
              //                                       fontSize: 10,
              //                                       color: Colors.black,
              //                                       fontWeight: FontWeight.w600),
              //                                 )
              //                               ],
              //                             ),
              //                           )
              //                         ],
              //                       ))
              //                 ]),
              //                 SizedBox(
              //                   height: 10,
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.symmetric(horizontal: 10),
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                     children: [
              //                       // SizedBox(
              //                       //   width: 15,
              //                       // ),
              //                       Column(
              //                         children: [
              //                           Image.asset(
              //                             "assets/icons/ic_helicopter.png",
              //                             height: 20,
              //                             width: 20,
              //                             fit: BoxFit.fill,
              //                           ),
              //                           Text('Heli')
              //                         ],
              //                       ),
              //                       SizedBox(
              //                         width: 10,
              //                       ),
              //                       Column(
              //                         children: [
              //                           Image.asset(
              //                             "assets/icons/hotel.png",
              //                             height: 20,
              //                             width: 20,
              //                             fit: BoxFit.fill,
              //                           ),
              //                           Text('Hotel')
              //                         ],
              //                       ),
              //                       SizedBox(
              //                         width: 10,
              //                       ),
              //                       Column(
              //                         children: [
              //                           Image.asset(
              //                             "assets/icons/meal.png",
              //                             height: 20,
              //                             width: 20,
              //                             fit: BoxFit.fill,
              //                           ),
              //                           Text('Lunch')
              //                         ],
              //                       ),
              //                       SizedBox(
              //                         width: 10,
              //                       ),
              //                       Column(
              //                         children: [
              //                           Image.asset(
              //                             "assets/icons/binocular.png",
              //                             height: 20,
              //                             width: 20,
              //                             fit: BoxFit.fill,
              //                           ),
              //                           Text('Visit')
              //                         ],
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.only(
              //                       left: 8.0, top: 8, right: 8),
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Container(
              //                         height: 30,
              //                         width: 111,
              //                         decoration: BoxDecoration(
              //                             color: Color(0xFFfb4d00),
              //                             borderRadius: BorderRadius.circular(10)),
              //                         child: Row(
              //                           children: [
              //                             SizedBox(
              //                               width: 5,
              //                             ),
              //                             Text(
              //                               'View Details',
              //                               style: TextStyle(
              //                                   fontWeight: FontWeight.w600,
              //                                   fontSize: 14,
              //                                   color: Colors.white),
              //                             ),
              //                             Icon(
              //                               Icons.arrow_right_outlined,
              //                               color: Colors.white,
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       Column(
              //                         children: [
              //                           Row(
              //                             children: [
              //                               Icon(
              //                                 Icons.currency_rupee,
              //                                 size: 16,
              //                                 color: Colors.grey[500],
              //                               ),
              //                               Text(
              //                                 '1190',
              //                                 style: TextStyle(
              //                                     fontWeight: FontWeight.w500,
              //                                     color: Colors.grey[500],
              //                                     decoration:
              //                                         TextDecoration.lineThrough),
              //                               ),
              //                             ],
              //                           ),
              //                           Column(
              //                             children: [
              //                               // SizedBox(
              //                               //   width: 25,
              //                               // ),
              //                               Row(
              //                                 children: [
              //                                   Icon(
              //                                     Icons.currency_rupee,
              //                                     size: 20,
              //                                     color: Colors.black,
              //                                   ),
              //                                   Text(
              //                                     '10000',
              //                                     style: TextStyle(
              //                                         fontWeight: FontWeight.w500,
              //                                         fontSize: 17),
              //                                   ),
              //                                 ],
              //                               ),
              //                               Text(
              //                                 'Per Person',
              //                                 style: TextStyle(
              //                                   fontSize: 10,
              //                                 ),
              //                               ),
              //                             ],
              //                           )
              //                         ],
              //                       )
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );
              //       }),
              // )
            ],
          ),
        ),
      ],
    );
  }

  travelicon(viewtype) {
    if (viewtype == 1) {
      return Column(
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
    } else if (viewtype == 2) {
      return Column(
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
    } else if (viewtype == 3) {
      return Column(
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
    } else if (viewtype == 4) {
      return Column(
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
