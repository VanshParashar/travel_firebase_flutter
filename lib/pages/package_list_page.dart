import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../read data/get_user_name.dart';
import 'modelsheet.dart';

class PackageListPage extends StatefulWidget {
  const PackageListPage({Key? key}) : super(key: key);

  @override
  State<PackageListPage> createState() => _PackageListPageState();
}

class _PackageListPageState extends State<PackageListPage> {
  //document ids
  List<String> docIDs = [];

  //get doc ids
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('package').orderBy("discountedPrice",descending: true).get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  // final user = FirebaseAuth.instance.currentUser!;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FutureBuilder(
                  future: getDocId(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: docIDs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          // title: Text(docIDs[index]),
                          title: GetUserName(documentId: docIDs[index],),
                        );
                      },
                    );
                  },
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
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Color(0xFFfb4d00),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: ModelSheet(btnname: "Plain Your Yatra",Colors: Colors.white,))),
                SizedBox(
                  height: 50,
                  width:  MediaQuery.of(context).size.width/7,
                  child: IconButton(
                      padding:  EdgeInsets.all(0.0),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Color(0xFFAFD4E5FF)),
                      onPressed: () async {
                        //To remove the keyboard when button is pressed
                        FocusManager.instance.primaryFocus?.unfocus();

                        var whatsappUrl =
                            "whatsapp://send?phone=${917838908606}" +
                                "&text=${Uri.encodeComponent("hi there testing ")}";
                        try {
                          launch(whatsappUrl);
                        } catch (e) {
                          //To handle error and display error message
                        }
                      },
                      icon: Image.asset("assets/icons/whatsapp.png",width: MediaQuery.of(context).size.width/7,)
                  ),
                )
              ],
            ))
    );
  }
}
