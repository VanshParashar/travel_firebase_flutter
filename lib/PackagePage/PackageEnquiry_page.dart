// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_firebase_flutter/pages/modelsheet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class EnquiryPackagePage extends StatefulWidget {
  const EnquiryPackagePage({Key? key}) : super(key: key);

  @override
  State<EnquiryPackagePage> createState() => _EnquiryPackagePageState();
}

class _EnquiryPackagePageState extends State<EnquiryPackagePage> {
  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse('tel:+917838908606');
    return Container(
      height: 160,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5),
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
          height: 90,
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 5,
            margin: EdgeInsets.zero,
            color: Color(0xffAEC4D5FF),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Need Yatra Expert\'s Help ?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                      'Are you interested in planning a yatra now ? It takes only 2 minutes!',
                      textAlign: TextAlign.start),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(9)),
                      child: Center(
                        child: ModelSheet(
                          btnname: "QUICK ENQUIRY",
                          Colors: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                        border: Border.all(
                          color: Colors.black
                        )
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          // FlutterPhoneDirectCaller.callNumber('917838908606');
                          // launch('tel : 917838908606');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            print('cannot launch this url');
                          }
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.phone,
                              size: 16,color: Color(0xFFfb4d00),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "+917838908606",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
