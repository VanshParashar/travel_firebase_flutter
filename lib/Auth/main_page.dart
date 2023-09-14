// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travel_firebase_flutter/Auth/auth_page.dart';
import 'package:travel_firebase_flutter/pages/More_page.dart';
import 'package:travel_firebase_flutter/pages/login_page.dart';
import 'package:travel_firebase_flutter/PackagePage/pakage_page.dart';
import 'package:travel_firebase_flutter/pages/offer_page.dart';
import 'package:travel_firebase_flutter/pages/search_page.dart';

import '../HomePage/home_page.dart';
import '../pages/package_list_page.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  //
  // final List<Widget> _pages =[
  //   HomePage(),
  //   PackageListPage(),
  //   SearchPage(),
  //   OfferPage(),
  //   ProfilePage(),
  // ];
  List<String> docIDs = [];

  //get doc ids
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('package').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
          docIDs.add(document.reference.id);
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(initialIndex: 0,
        length: 5,animationDuration: Duration(milliseconds: 1),
        child: Scaffold(
          body: TabBarView(
            children: [
              HomePage(),
              PackageListPage(),
              SearchPage(),
              OfferPage(),
              ProfilePage(),
          ],

          ),
          // body: _pages[_selectedIndex],
          // body: StreamBuilder<User?>(
          //       stream: FirebaseAuth.instance.authStateChanges(),
          //       builder: (context,snapshot){
          //         if(snapshot.hasData){
          //           return _pages[_selectedIndex];
          //         }
          //         else {
          //           return _pages[_selectedIndex];
          //          // return AuthPage();
          //         }
          //       },
          //     ),
          appBar: AppBar(toolbarHeight: 61,
            elevation: 5,shape:BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(0)
          ),
            // primary: false,
            title:
            TabBar(
              onTap: _navigateBottomBar,
              enableFeedback: true,
              unselectedLabelColor: Colors.black,
              labelColor: Color(0xFFfb4d00),
              labelStyle: TextStyle(fontSize: 14),
              indicatorColor:Color(0xFFfb4d00),
              labelPadding: EdgeInsets.all(3),
              // elevation: 2,
              // flexibleSpace:
              // BottomNavigationBar(
              //   currentIndex: _selectedIndex,
              //   onTap: _navigateBottomBar,
              //   selectedIconTheme: IconThemeData(color: Color(0xFFfb4d00)),
              //   fixedColor: Colors.black,
              //   showUnselectedLabels: true,
              //   type: BottomNavigationBarType.fixed,
              //   items: [
              //     BottomNavigationBarItem(icon: Image.asset("assets/icons/home_icn.png",height: 25,width: 25,),label: 'Home'),
              //     BottomNavigationBarItem(icon: Image.asset("assets/icons/packages_icn.png",height: 25,width: 25,),label: 'Package',),
              //     BottomNavigationBarItem(icon:Image.asset("assets/icons/search_icn.png",height: 25,width: 25,),label: 'Search'),
              //     BottomNavigationBarItem(icon:Image.asset("assets/icons/offer_icn.png",height: 25,width: 25,),label: 'Offer'),
              //     BottomNavigationBarItem(icon:Image.asset("assets/icons/more_icn.png",height: 25,width: 25,),label: 'More'),
              //
              //   ],
              // ),
              tabs: [
                    Tab(icon: Image.asset("assets/icons/home_icn.png",height: 25,width: 25,),text: 'Home'),
                    Tab(icon: Image.asset("assets/icons/packages_icn.png",height: 25,width: 25,),text: 'Package',),
                    Tab(icon:Image.asset("assets/icons/search_icn.png",height: 25,width: 25,),text: 'Search'),
                    Tab(icon:Image.asset("assets/icons/offer_icn.png",height: 25,width: 25,),text: 'Offer'),
                    Tab(icon:Image.asset("assets/icons/more_icn.png",height: 25,width: 25,),text: 'More'),
              ],
            ),
          ),
          // TabBar(
          //   onTap: _navigateBottomBar,
          //   enableFeedback: true,indicatorPadding: EdgeInsets.all(4),
          //   // unselectedLabelColor: Colors.black,
          //   labelColor: Colors.grey.shade800,
          //   labelStyle: TextStyle(fontSize: 14),
          //   indicatorColor:Color(0xFFfb4d00),
          //   labelPadding: EdgeInsets.all(3),
          //   // elevation: 2,
          //   // flexibleSpace:
          //   // BottomNavigationBar(
          //   //   currentIndex: _selectedIndex,
          //   //   onTap: _navigateBottomBar,
          //   //   selectedIconTheme: IconThemeData(color: Color(0xFFfb4d00)),
          //   //   fixedColor: Colors.black,
          //   //   showUnselectedLabels: true,
          //   //   type: BottomNavigationBarType.fixed,
          //   //   items: [
          //   //     BottomNavigationBarItem(icon: Image.asset("assets/icons/home_icn.png",height: 25,width: 25,),label: 'Home'),
          //   //     BottomNavigationBarItem(icon: Image.asset("assets/icons/packages_icn.png",height: 25,width: 25,),label: 'Package',),
          //   //     BottomNavigationBarItem(icon:Image.asset("assets/icons/search_icn.png",height: 25,width: 25,),label: 'Search'),
          //   //     BottomNavigationBarItem(icon:Image.asset("assets/icons/offer_icn.png",height: 25,width: 25,),label: 'Offer'),
          //   //     BottomNavigationBarItem(icon:Image.asset("assets/icons/more_icn.png",height: 25,width: 25,),label: 'More'),
          //   //
          //   //   ],
          //   // ),
          //   tabs: [
          //         Tab(icon: Image.asset("assets/icons/home_icn.png",height: 25,width: 25,),text: 'Home'),
          //         Tab(icon: Image.asset("assets/icons/packages_icn.png",height: 25,width: 25,),text: 'Package',),
          //         Tab(icon:Image.asset("assets/icons/search_icn.png",height: 25,width: 25,),text: 'Search'),
          //         Tab(icon:Image.asset("assets/icons/offer_icn.png",height: 25,width: 25,),text: 'Offer'),
          //         Tab(icon:Image.asset("assets/icons/more_icn.png",height: 25,width: 25,),text: 'More'),
          //   ],
          // ),
        ),
      ),
    );
  }
}

// flexibleSpace: SalomonBottomBar(
//   currentIndex: _selectedIndex,
//   onTap: _navigateBottomBar,
//   items: [
//     SalomonBottomBarItem(icon: Image.asset("assets/icons/home_icn.png",height: 25,width: 25,),title: Text('Home')),
//     SalomonBottomBarItem(icon: Image.asset("assets/icons/packages_icn.png",height: 25,width: 25,),title: Text('Package')),
//     SalomonBottomBarItem(icon:Image.asset("assets/icons/search_icn.png",height: 25,width: 25,),title: Text('Search')),
//     SalomonBottomBarItem(icon:Image.asset("assets/icons/offer_icn.png",height: 25,width: 25,),title: Text('Offer')),
//     SalomonBottomBarItem(icon:Image.asset("assets/icons/more_icn.png",height: 25,width: 25,),title: Text('More')),
//
//   ],
// ),