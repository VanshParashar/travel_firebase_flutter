// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_firebase_flutter/Auth/auth_page.dart';
import 'package:travel_firebase_flutter/pages/modelsheet.dart';
import 'package:travel_firebase_flutter/pages/package_list_page.dart';
import 'package:travel_firebase_flutter/pages/search_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../HomePage/home_page.dart';
import 'offer_page.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // List<String> docIDs = [];
  String name = "";
  final Uri url = Uri.parse('tel:+917838908606');
  var isLogin = false;
  var auth = FirebaseAuth.instance;
  final Uri urlprivacy = Uri.parse('https://www.chardhamtour.in/privacy-policy');
  final Uri urlterm = Uri.parse('https://www.chardhamtour.in/terms-and-conditions ');
  final Uri urlfab = Uri.parse('https://m.facebook.com/ChardhamYatraaUttarakhand/?wtsid=rdr_0VJaDL3nVognCuYej');
  final Uri urltwit = Uri.parse('https://twitter.com/ChardhaamTour?s=09');
  final Uri urlinsta = Uri.parse('https://instagram.com/tours_chardham?igshid=MWZjMTM2ODFkZg== ');
  final Uri urlyt = Uri.parse('https://youtube.com/@ChardhamTour?si=zzUag2TNn3Eg2lwI ');
  final Uri urlsite = Uri.parse('https://www.chardhamtour.in/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: StreamBuilder<User?>(
                  stream: auth.authStateChanges(),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      return Row(
                            children: [
                              Container(
                                height: 50,width: 40,
                                child: Icon(Icons.logout,color: Colors.grey,),
                              ),
                              SizedBox(width: 20,),
                              GestureDetector(
                                onTap: (){
                                  FirebaseAuth.instance.signOut();
                                },
                                child: Container(
                                  child: Text("Log Out",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                                ),
                              )
                            ],
                          );
                    }else{
                      return  Row(
                            children: [
                              Container(
                                height: 50,width: 40,
                                child: Icon(Icons.login,color:Colors.grey,),
                              ),
                              SizedBox(width: 20,),
                              GestureDetector(
                                onTap: (){
                                  // AuthPage();
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>AuthPage()));
                                },
                                child: Container(
                                  child: Text("Log In",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                                ),
                              )
                            ],
                          );
                    }
                  },
                ),
                // child:  FirebaseAuth.instance.currentUser != null ?
                // Row(
                //   children: [
                //     Container(
                //       height: 50,width: 40,
                //       child: Icon(Icons.logout),
                //     ),
                //     SizedBox(width: 20,),
                //     GestureDetector(
                //       onTap: (){
                //         FirebaseAuth.instance.signOut();
                //       },
                //       child: Container(
                //         child: Text("Log Out",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                //       ),
                //     )
                //   ],
                // ):
                // Row(
                //   children: [
                //     Container(
                //       height: 50,width: 40,
                //       child: Icon(Icons.login),
                //     ),
                //     SizedBox(width: 20,),
                //     GestureDetector(
                //       onTap: (){
                //         // AuthPage();
                //         Navigator.push(context, MaterialPageRoute(builder: (_)=>AuthPage()));
                //       },
                //       child: Container(
                //         child: Text("Log In",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                //       ),
                //     )
                //   ],
                // )
              ),
            Divider(
              color: Colors.black,
              height: 10,
              thickness: 1,
              endIndent: 10,
              indent: 10,
            ),
            GestureDetector(
              onTap: ()async {
                // FlutterPhoneDirectCaller.callNumber('917838908606');
                // launch('tel : 917838908606');
                if(await canLaunchUrl(url)){
                  await launchUrl(url);
                }else {
                  print('cannot launch this url');
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Container(
                      height: 30,width: 20,
                      child: Image.asset("assets/icons/ic_call.png",height: 30,width: 20,)
                    ),
                    SizedBox(width: 30,),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Call Us",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                              SizedBox(width: 10,),
                              Text("+91-7838908606",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFFfb4d00)),)
                            ],
                          ),
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Text("Available 24/7 Yatra Support",style: TextStyle(color: Colors.grey[600]),),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              height: 10,
              thickness: 1,
              endIndent: 10,
              indent: 10,
            ),
            GestureDetector(
              onTap: () async{
                String email = Uri.encodeComponent("mail@fluttercampus.com");
                String subject = Uri.encodeComponent("Hello Flutter");
                String body = Uri.encodeComponent("Hi! I'm Flutter Developer");
                print(subject); //output: Hello%20Flutter
                Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
                if (await launchUrl(mail,mode: LaunchMode.externalNonBrowserApplication)) {
                  //email app opened
                }else{
                  //email app is not opened
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Container(
                      height: 50,width: 30,
                      child: Image.asset("assets/icons/ic_email.png",height: 30,width: 30,)
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 300,
                      child: Column(
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,\
                            children: [
                              Text("Email Us",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                              SizedBox(width: 10,),
                              Text("yatra@chardhamtour.in",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFFfb4d00)),)
                            ],
                          ),
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Text("Available Monday to Saturday 10 AM to 8 PM",style: TextStyle(color: Colors.grey[600]),),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              height: 10,
              thickness: 1,
              endIndent: 10,
              indent: 10,
            ),
            GestureDetector(
              onTap: () async {
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
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      height: 50,width: 40,
                      child: Image.asset("assets/icons/whatsapp_icon.png",height: 30,width: 30,),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 300,
                      child: Column(
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,\
                            children: [
                              Text("Whatsapp Us",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                              SizedBox(width: 10,),
                              Text("91-7838908606",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFFfb4d00)),)
                            ],
                          ),
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Text("Tell us details of your Yatra plan",style: TextStyle(color: Colors.grey[600]),),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              height: 10,
              thickness: 1,
              endIndent: 10,
              indent: 10,
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Container(
                      height: 30,width: 30,
                      child: Image.asset("assets/icons/ic_enquire.png",height: 30,width: 30,)
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 300,
                      child: Column(
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,\
                            children: [
                              Text("Enquiry Us",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                              SizedBox(width: 10,),
                              // Text("Plain Your Yatra",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFFfb4d00)),),
                              ModelSheet(btnname: 'Plain Your Yatra',Colors: Color(0xFFfb4d00),),
                            ],
                          ),
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Text("Simplify Yatra itinerary by travel experts",style: TextStyle(color: Colors.grey[600]),),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              height: 10,
              thickness: 1,
              endIndent: 10,
              indent: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Container(
                      height: 30,width: 30,
                      child: Image.asset("assets/icons/ic_location.png",height: 30,width: 30,)
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: 300,
                    child: Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,\
                          children: [
                            Text("Head Office",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                           ],
                        ),
                        SizedBox(height: 8,),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text("Rajeshwar Nagar Phase 1, IT Park, ",style: TextStyle(color: Colors.grey[600]),),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Sahastradhara road, Dehradun,248001",style: TextStyle(color: Colors.grey[600]),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text("100+ Agents | 40k+ Yatris | 55+ Destinations",style: TextStyle(color: Colors.grey[600]),),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              height: 10,
              thickness: 1,
              endIndent: 10,
              indent: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Container(
                    height: 30,width: 30,
                    child: Image.asset("assets/icons/ic_heart.png",height: 20,width: 20,),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    child: Text("Rate Us",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              height: 10,
              thickness: 1,
              endIndent: 10,
              indent: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Container(
                    height: 30,width: 30,
                  child: Image.asset("assets/icons/ic_share.png",height: 30,width: 30,)
                  ),
                  SizedBox(width: 20,),
                  Container(
                    child: Text("Share App",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              height: 10,
              thickness: 1,
              endIndent: 10,
              indent: 10,
            ),
            SizedBox(height: 10,),
            Column(
              children: [
                Text("Connect With Us:",style: TextStyle(fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (!await launchUrl(urlfab,mode: LaunchMode.externalApplication)) {
                          throw Exception('Could not launch $urlfab');
                        }
                      },
                      child: Container(
                        height: 50,width: 40,
                        child: Image.asset("assets/images/facebook300.png",height: 30,width: 30,),
                      ),
                    ),
                    SizedBox(width: 15,),
                    GestureDetector(
                      onTap: () async {
                        if (!await launchUrl(urltwit,mode: LaunchMode.externalApplication)) {
                          throw Exception('Could not launch $urltwit');
                        }
                      },
                      child: Container(
                        height: 50,width: 40,
                        child: Image.asset("assets/images/twitter300.png",height: 30,width: 30,),
                      ),
                    ),
                    SizedBox(width: 15,),
                    GestureDetector(
                      onTap: () async {
                        if (!await launchUrl(urlinsta,mode: LaunchMode.externalApplication)) {
                          throw Exception('Could not launch $urlinsta');
                        }
                      },
                      child: Container(
                        height: 50,width: 40,
                        child: Image.asset("assets/images/instagram300.png",height: 30,width: 30,),
                      ),
                    ),
                    SizedBox(width: 15,),
                    GestureDetector(
                      onTap: () async {
                        if (!await launchUrl(urlyt,mode: LaunchMode.externalApplication)) {
                          throw Exception('Could not launch $urlyt');
                        }
                      },
                      child: Container(
                        height: 50,width: 40,
                        child: Image.asset("assets/images/youtube300.png",height: 30,width: 30,),
                      ),
                    ),
                    SizedBox(width: 10,),
                  ],
                ),SizedBox(height: 10,),
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          if (!await launchUrl(urlprivacy,mode: LaunchMode.externalApplication)) {
                          throw Exception('Could not launch $urlprivacy');
                          }
                        },
                          child: Text("Privacy policy",style: TextStyle(color:Color(0xFFfb4d00),fontSize: 15),)),
                      VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                        width: 40,
                      ),
                      GestureDetector(
                          onTap: ()async {
                            if (!await launchUrl(urlterm,mode: LaunchMode.externalApplication)) {
                              throw Exception('Could not launch $urlterm');
                            }
                          },
                          child: Text("Terms of use",style: TextStyle(color:Color(0xFFfb4d00),fontSize: 15),)),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                    onTap: ()async {
                      if (!await launchUrl(urlsite,mode: LaunchMode.externalApplication)) {
                        throw Exception('Could not launch $urlsite');
                      }
                    },
                    child: Text("www.chardhamtour.in",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.grey.shade600),)),
                SizedBox(height: 40,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// body: FutureBuilder(
//     future: getDocId(),
//     builder: (context, snapshot) {
//       return ListView.builder(
//           itemCount: docIDs.length,
//           itemBuilder: (context, index) {
//             return FutureBuilder<DocumentSnapshot>(
//                 future: users.doc(docIDs[index]).get(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     Map<String, dynamic> data =
//                         snapshot.data!.data() as Map<String, dynamic>;
//                     return Text(data['first name']);
//                   }
//                   return Text('Loading');
//                 });
//           });
//     }),
