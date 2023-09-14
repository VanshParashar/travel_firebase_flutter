// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class GuidelinesPage extends StatefulWidget {
   GuidelinesPage({Key? key, required this.datafromuser}) : super(key: key);
  Map<String, dynamic> datafromuser;
  @override
  State<GuidelinesPage> createState() => _GuidelinesPageState();
}

class _GuidelinesPageState extends State<GuidelinesPage> {
  bool _isreadmore = false;

  @override
  Widget build(BuildContext context) {
    var itemlength=(widget.datafromuser['guidelinesList'] as List ).length;
    return  Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
            child:
            Text('Guidelines for Traveller ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Color(0xFFfb4d00)),),
          ),
          ListView.builder(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.zero,
              itemCount: _isreadmore ? itemlength : 3,
              itemBuilder: (context,index){
                return  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children: [
                          SizedBox(width: 10,),
                          FaIcon(FontAwesomeIcons.arrowsToDot),
                          SizedBox(width: 10,),
                          Expanded(child: Text(widget.datafromuser["guidelinesList"][index],style: TextStyle(fontSize : 15,wordSpacing: 3,height: 1.4),)),
                        ],
                    ),
                    SizedBox(height: 14,),
                  ],
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
