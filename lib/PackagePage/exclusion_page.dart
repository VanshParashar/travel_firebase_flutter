// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExclusionPage extends StatefulWidget {
  ExclusionPage({Key? key, required this.datafromuser}) : super(key: key);
  Map<String, dynamic> datafromuser;

  @override
  State<ExclusionPage> createState() => _ExclusionPageState();
}

class _ExclusionPageState extends State<ExclusionPage> {
  bool _isreadmore = false;

  @override
  Widget build(BuildContext context) {
    var itemlength=(widget.datafromuser['exclusionsList'] as List ).length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20,top: 10),
          child:
          Text('Exclusion ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Color(0xFFfb4d00)),),
        ),
        SizedBox(height: 10,),
        ListView.builder(
            padding: EdgeInsets.zero,
          shrinkWrap: true,
            primary: false,
            itemCount: _isreadmore ? itemlength : 3,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset('assets/images/cross.png',fit: BoxFit.fill,)),
                      Expanded(child: Text(widget.datafromuser['exclusionsList'][index],textAlign: TextAlign.center)),

                    ],
                  ),
                  SizedBox(height: 10,),
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
    );
  }
}
