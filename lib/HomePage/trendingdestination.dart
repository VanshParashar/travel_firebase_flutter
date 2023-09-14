// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:travel_firebase_flutter/pages/package_list_page.dart';

class TrendingDestinationView extends StatefulWidget {
  const TrendingDestinationView({Key? key}) : super(key: key);

  @override
  State<TrendingDestinationView> createState() =>
      _TrendingDestinationViewState();
}

class _TrendingDestinationViewState extends State<TrendingDestinationView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Trending Destinations",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            GestureDetector(
              onTap: () {
                DefaultTabController.of(context).animateTo(2);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => PackageListPage()));
              },
              child: Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/badrinath.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                    child: Container(
                      height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/overlay_pic.png",
                        ),
                        fit: BoxFit.cover,
                        opacity: .6),
                  ),
                )),
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  child: Center(
                    child: Text(
                      "Badrinath",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.white),
                    ),
                  ),
                ),
              ]),
            ),

            GestureDetector(
              onTap: () {
                DefaultTabController.of(context).animateTo(2);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => PackageListPage()));
              },
              child: Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/kedarnath.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                    child: Container(
                      height: MediaQuery.of(context).size.width * .22,
                      width: MediaQuery.of(context).size.width * .22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/overlay_pic.png",
                            ),
                            fit: BoxFit.cover,
                            opacity: .6),
                      ),
                    )),
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  child: Center(
                    child: Text(
                      "Kedarnath",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.white),
                    ),
                  ),
                ),
              ]),
            ),

            GestureDetector(
              onTap: () {
                DefaultTabController.of(context).animateTo(2);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => PackageListPage()));
              },
              child: Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/gangotri.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                    child: Container(
                      height: MediaQuery.of(context).size.width * .22,
                      width: MediaQuery.of(context).size.width * .22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/overlay_pic.png",
                            ),
                            fit: BoxFit.cover,
                            opacity: .6),
                      ),
                    )),
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  child: Center(
                    child: Text(
                      "Gangotri",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.white),
                    ),
                  ),
                ),
              ]),
            ),

            GestureDetector(
              onTap: () {
                DefaultTabController.of(context).animateTo(2);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => PackageListPage()));
              },
              child: Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/yamnotri.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                    child: Container(
                      height: MediaQuery.of(context).size.width * .22,
                      width: MediaQuery.of(context).size.width * .22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/overlay_pic.png",
                            ),
                            fit: BoxFit.cover,
                            opacity: .6),
                      ),
                    )),
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  child: Center(
                    child: Text(
                      "Yamunotri",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.white),
                    ),
                  ),
                ),
              ]),
            ),

          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            GestureDetector(
              onTap: () {
                DefaultTabController.of(context).animateTo(2);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => PackageListPage()));
              },
              child: Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/haridwar.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                    child: Container(
                      height: MediaQuery.of(context).size.width * .22,
                      width: MediaQuery.of(context).size.width * .22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/overlay_pic.png",
                            ),
                            fit: BoxFit.cover,
                            opacity: .6),
                      ),
                    )),
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  child: Center(
                    child: Text(
                      "Haridwar",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.white),
                    ),
                  ),
                ),
              ]),
            ),

            GestureDetector(
              onTap: () {
              },
              child: Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/rishikesh.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                    child: Container(
                      height: MediaQuery.of(context).size.width * .22,
                      width: MediaQuery.of(context).size.width * .22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/overlay_pic.png",
                            ),
                            fit: BoxFit.cover,
                            opacity: .6),
                      ),
                    )),
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  child: Center(
                    child: Text(
                      "Rishikesh",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.white),
                    ),
                  ),
                ),
              ]),
            ),

            GestureDetector(
              onTap: () {
              },
              child: Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/nainital.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                    child: Container(
                      height: MediaQuery.of(context).size.width * .22,
                      width: MediaQuery.of(context).size.width * .22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/overlay_pic.png",
                            ),
                            fit: BoxFit.cover,
                            opacity: .6),
                      ),
                    )),
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  child: Center(
                    child: Text(
                      "Nainital",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.white),
                    ),
                  ),
                ),
              ]),
            ),

            GestureDetector(
              onTap: () {
              },
              child: Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/mussoorie.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                    child: Container(
                      height: MediaQuery.of(context).size.width * .22,
                      width: MediaQuery.of(context).size.width * .22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/overlay_pic.png",
                            ),
                            fit: BoxFit.cover,
                            opacity: .6),
                      ),
                    )),
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  child: Center(
                    child: Text(
                      "Mussoorie",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.white),
                    ),
                  ),
                ),
              ]),
            ),

          ],
        ),
      ],
    );
  }
}
