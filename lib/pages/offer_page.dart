// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Container(
        height: 200,
        width: 500,
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "assets/images/slide3.jpg",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
