// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
class HotelsView extends StatefulWidget {
   HotelsView({Key? key,required this.data}) : super(key: key);
Map<String,dynamic> data;
  @override
  State<HotelsView> createState() => _HotelsViewState();
}

class _HotelsViewState extends State<HotelsView> {
  bool _isreadmore = false;

  @override
  Widget build(BuildContext context) {
    var itemlength=(widget.data['hotelsList'] as List ).length;

    return  Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10),
            child:
            Text('Hotels ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Color(0xFFfb4d00)),),
          ),
          SizedBox(height: 10,),
          ListView.builder(
            shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.zero,
              itemCount: _isreadmore ? itemlength :3,
              itemBuilder: (context,index){
            return   Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
              child: Table(
                border: TableBorder.all(color: Colors.black),
                children: [
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Destination:',textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.data['hotelsList'][index]['textDestination'],textAlign: TextAlign.end,style: TextStyle(fontSize: 16),),
                        ),
                      ]),
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Hotel/Similar:',textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.data['hotelsList'][index]['textHotels'],textAlign: TextAlign.end,style: TextStyle(fontSize: 16),),
                        ),
                      ]),
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Meal Plan:',textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.data['hotelsList'][index]['textMeals'],textAlign: TextAlign.end,style: TextStyle(fontSize: 16),),
                        ),
                      ]),
                ],
              ),
            );
          }),
          TextButton(
              onPressed: () {
                setState(() {
                  // itemlength=(widget.datafromuser['InclusionList'] as List ).length;
                  _isreadmore = !_isreadmore;
                });
              },
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    _isreadmore ? 'Read Less' : 'Read More',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Color(0xFFfb4d00)),
                  ))),
        ],
      ),
    );
  }
}
