// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FAQs extends StatefulWidget {
  FAQs({Key? key, required this.datafromuser}) : super(key: key);
  Map<String, dynamic> datafromuser;

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  bool _isreadmore = false;

  @override
  Widget build(BuildContext context) {
    var itemlength=(widget.datafromuser['fAQsList'] as List ).length;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // widget.datafromuser["fAQsList"].isNotEmpty() ?Text('FAQs ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Color(0xFFfb4d00)),):Text("a"),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 10),
              child:
              Text('FAQs ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Color(0xFFfb4d00)),),
            ),
            ListView.builder(
                primary: false,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: _isreadmore ? itemlength : 3,
                itemBuilder: (context,index){
                  return ExpansionTile(
                    title: Row(
                    children: [
                      Text(widget.datafromuser['fAQsList'][index]['textQ'],style: TextStyle(color: Color(0xFFfb4d00)),),
                      SizedBox(width: 10,),
                      Expanded(child: Text(widget.datafromuser['fAQsList'][index]['textQuestion'],maxLines: 3,style: TextStyle(fontWeight: FontWeight.w600),)),
                    ],
                  ),
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Text('Ans:',style: TextStyle(color: Colors.lightGreen),),
                        SizedBox(width: 10,),
                        Expanded(child: Text(widget.datafromuser['fAQsList'][index]['textAnswer'],style: TextStyle(wordSpacing: 3,height: 1.4),)),
                      ],
                    ),
                    SizedBox(height: 10,)
                  ],);

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


// Padding(
// padding: const EdgeInsets.all(10.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// children: [
// Text(widget.datafromuser['faqsList'][index]['textq']),
// SizedBox(width: 10,),
// Text(widget.datafromuser['faqsList'][index]['textQuestion']),
// ],
// ),
// SizedBox(height: 10,),
// Row(
// children: [
// Text('Ans:'),
// SizedBox(width: 10,),
// Text(widget.datafromuser['faqsList'][index]['textAnswer']),
// ],
// ),
// ],
// ),
// );