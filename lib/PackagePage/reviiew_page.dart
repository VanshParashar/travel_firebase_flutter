// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ReviewPACKAGEpage extends StatefulWidget {
  ReviewPACKAGEpage({Key? key, required this.datafromuser}) : super(key: key);
  Map<String, dynamic> datafromuser;

  @override
  State<ReviewPACKAGEpage> createState() => _ReviewPACKAGEpageState();
}

class _ReviewPACKAGEpageState extends State<ReviewPACKAGEpage> {
  List<String> docIDs = [];
  String? name;

  Text _buildRatingStars(double rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  //get doc ids
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('reviewIOS').get().then(
      (snapshot) {
        docIDs = [];
        snapshot.docs.forEach(
          (document) {
            docIDs.add(document.reference.id);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference reviewdata =
        FirebaseFirestore.instance.collection('reviewIOS');
    return FutureBuilder(
        future: getDocId(),
        builder: (context, snapshot) {
          return ListView.builder(
              primary: false,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: docIDs.length,
              itemBuilder: (context, index) {
                return FutureBuilder<DocumentSnapshot>(
                    future: reviewdata.doc(docIDs[index]).get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildRatingStars(data['rating']),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.datafromuser['name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  data['review'],
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      data['name'],
                                      style: TextStyle(
                                          color: Colors.grey.shade700),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      data['email'],
                                      style: TextStyle(
                                          color: Colors.grey.shade700),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return Shimmer.fromColors(
                          baseColor: Colors.grey[100]!,
                          highlightColor: Colors.grey[600]!,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ));
                    });
              });
        });
  }

  datetime(snapshot) {
    var snapshot;
    final Timestamp timestamp = snapshot.data['rating'] as Timestamp;
    final DateTime dateTime = timestamp.toDate();
    final dateString = DateFormat('K:mm:ss').format(dateTime);
    Container(
      child: Text(dateString),
    );
  }
}
