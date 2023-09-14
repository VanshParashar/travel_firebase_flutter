// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:travel_firebase_flutter/PackagePage/Guideline_page.dart';
import 'package:travel_firebase_flutter/PackagePage/hotels_view.dart';
import 'package:travel_firebase_flutter/PackagePage/inclusion_page.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:travel_firebase_flutter/PackagePage/review_alert_page.dart';
import 'package:travel_firebase_flutter/PackagePage/reviiew_page.dart';
import 'package:travel_firebase_flutter/pages/booking_page.dart';
import 'PackageEnquiry_page.dart';
import 'exclusion_page.dart';
import 'faqs.dart';

class PackagePage extends StatefulWidget {
  PackagePage({
    Key? key,
    required this.datafromuser,
  }) : super(key: key);

  Map<String, dynamic> datafromuser;

  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  bool _isreadmore = false;
  ItemScrollController itemScrollController = ItemScrollController();

  @override
  void initState() {
    itemScrollController = ItemScrollController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final lines = _isreadmore ? null : 4;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(8),
              child: Container(
                color: Colors.white,
                child: DefaultTabController(
                  length: 8,
                  child: TabBar(
                    indicatorColor: Color(0xFFfb4d00),
                    onTap: (selectedTabIndex) {
                      itemScrollController.scrollTo(
                          index: selectedTabIndex,
                          duration: Duration(seconds: 1));
                    },
                    isScrollable: true,
                    tabs: [
                      Tab(
                        child: Text(
                          'Overview',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Itinerary',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Hotels',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Inclusion/Exclusion',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Guidelines',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'FAQs',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Enquiry',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Reviews',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
              ),
            ),
            pinned: true,
            expandedHeight: 242,
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(
              children: [
                Container(
                    height: MediaQuery.of(context).size.width - 170,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.zero,
                      ),
                      child: Image.network(
                        widget.datafromuser['banner'],
                        fit: BoxFit.fill,
                      ),
                    )),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: <Widget>[
                              // Stroked text as border.
                              Text(
                                widget.datafromuser['name'],
                                style: TextStyle(
                                fontSize: 20,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 3
                                    ..color = Colors.orangeAccent.shade400!,
                                ),
                              ),
                              // Solid text as fill.
                              Text(
                                widget.datafromuser['name'],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey[300],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFfb4d00),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5)),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.sunny,
                                  color: Colors.white,
                                ),
                                Text(
                                  widget.datafromuser['days'],
                                  style: TextStyle(
                                    fontSize: 10,color: Colors.white
                                  ),
                                ),
                              ],
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
                                Icon(Icons.nightlight),
                                Text(
                                  widget.datafromuser['nights'],
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ],
            )),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Overview',
                            style: TextStyle(
                                fontSize: 18, color: Color(0xFFfb4d00))),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                         replace( widget.datafromuser['textOverview']),
                          maxLines: lines,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 18,
                              overflow: _isreadmore
                                  ? TextOverflow.visible
                                  : TextOverflow.ellipsis),
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _isreadmore = !_isreadmore;
                              });
                            },
                            child: SizedBox(
                                height: 20,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  _isreadmore ? 'Read Less' : 'Read More',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(color: Color(0xFFfb4d00)),
                                ))),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  elevation: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text("Itinerary",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Color(0xFFfb4d00)),)
                          ],
                        ),
                      ),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        primary: false,
                        itemCount: (widget.datafromuser['daysList'] as List).length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ExpansionTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: Text(
                                        widget.datafromuser['daysList'][index]
                                            ['textDay'],
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xFFfb4d00),
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child:
                                      Text(replace(widget.datafromuser['daysList'][index]['textDeparture']),style: TextStyle(color: Colors.black),),
                                    ),
                                    // Location List
                                    SizedBox(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                          physics: NeverScrollableScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: (widget.datafromuser['daysList']
                                                  [index]['placesList'] as List)
                                              .length,
                                          itemBuilder: (context, indexid) {
                                            return Row(
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.black
                                                      ),
                                                        shape: BoxShape.rectangle,
                                                        borderRadius: BorderRadius.circular(7),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      '     ${widget.datafromuser['daysList'][index]['placesList'][indexid]}    ',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black
                                                      ),
                                                    ))),
                                                SizedBox(width: 10,)
                                              ],
                                            );
                                          }),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal: 20),
                                        height:
                                            MediaQuery.of(context).size.width / 2.8,
                                        width: MediaQuery.of(context).size.width /
                                            2,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              widget.datafromuser['daysList'][index]
                                                  ['image'],
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          replace(widget.datafromuser['daysList'][index]
                                          ['textExplanation']),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.black,
                                height: 10,
                                thickness: 1,
                                endIndent: 20,
                                indent: 20,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                HotelsView(data: widget.datafromuser,),
                Card(
                  margin: EdgeInsets.zero,
                  child: InclusionPage(datafromuser: widget.datafromuser,)
                ),
                SizedBox(height: 8,),
                Card(
                  margin: EdgeInsets.zero,
                  child: ExclusionPage(datafromuser: widget.datafromuser,)
                ),
                GuidelinesPage(datafromuser: widget.datafromuser),
                //faqs
                FAQs(
                  datafromuser: widget.datafromuser,
                ),
                EnquiryPackagePage(),
                ReviewPage(
                  datafromuser: widget.datafromuser,
                ),
                ReviewPACKAGEpage(datafromuser: widget.datafromuser),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child:Container(
          height: 70,
          color: Color(0xffAEC4D5FF),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        widget.datafromuser['mrp'],
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,color: Colors.grey[600],
                          decoration: TextDecoration.lineThrough),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.currency_rupee),
                        Text(
                          widget.datafromuser['discountedPrice'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                        Text(
                          '  (Per Person)',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              SizedBox(
                width: 110,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFfb4d00)),
                onPressed: () {
                  // BookingPage();
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>BookingPage()));
                },
                child: Container(
                    height: 50,
                    width: 70,
                    child: Center(child: Text('PROCEED to booking'))),
              )
            ],
          ),
        ),
      ),
    );
  }
  replace (data){
    var multiline = data;
    var singleline = multiline.replaceAll("\\n", " \n");
    print(singleline);
    return singleline;
  }
}
