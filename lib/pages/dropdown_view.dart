// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropdownView extends StatefulWidget {
  const DropdownView({Key? key}) : super(key: key);

  @override
  State<DropdownView> createState() => _DropdownViewState();
}

class _DropdownViewState extends State<DropdownView> {

  final List<String> items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '14',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      width: 194,
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          // Add Horizontal padding using menuItemStyleData.padding so it matches
          // the menu padding when button's width is not specified.
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          border: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(10),
          ),
          // Add more decoration..
        ),
        hint: Row(
          children: [
            Icon(Icons.person_outline_outlined,color: Color(0xFFfb4d00),size: 20,),
             Text(
              ' No. of people',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select no of people.';
          }
          return null;
        },
        onChanged: (value) {
          //Do something when selected item is changed.
        },
        onSaved: (value) {
          selectedValue = value.toString();
        },
        // buttonStyleData: const ButtonStyleData(
        //   padding: EdgeInsets.only(right: 8),
        // ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
