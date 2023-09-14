// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DestinationHotelsView extends StatefulWidget {
  const DestinationHotelsView({Key? key}) : super(key: key);

  @override
  State<DestinationHotelsView> createState() => _DestinationHotelsViewState();
}

class _DestinationHotelsViewState extends State<DestinationHotelsView> {
  final Uri urlallhotel = Uri.parse('https://www.chardhamhotel.in ');
  final Uri urlkedar =
      Uri.parse('https://www.chardhamhotel.in/kedarnath-hotels.html ');
  final Uri urlgangotri =
      Uri.parse('https://www.chardhamhotel.in/gangotri-hotels.html ');
  final Uri urlbadri =
      Uri.parse('https://www.chardhamhotel.in/badrinath-hotels.html ');
  final Uri urlyamnotri =
      Uri.parse('https://www.chardhamhotel.in/yamunotri-hotels.html ');
  final Uri urlguptkashi =
      Uri.parse('https://www.chardhamhotel.in/guptkashi-hotels.html');
  final Uri urlbarkot =
      Uri.parse('https://www.chardhamhotel.in/barkot-hotels.html ');
  final Uri urlsrinagar =
      Uri.parse('https://www.chardhamhotel.in/srinagar-hotels.html');
  final Uri urluttarkashi =
      Uri.parse('https://www.chardhamhotel.in/uttarkashi-hotels.html ');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Destination Hotels",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (!await launchUrl(urlallhotel,
                      mode: LaunchMode.externalApplication)) {
                    throw Exception('Could not launch $urlallhotel');
                  }
                },
                child: Text(
                  "[Show All]",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () async {
                if (!await launchUrl(urlkedar,
                    mode: LaunchMode.externalApplication)) {
                  throw Exception('Could not launch $urlkedar');
                }
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
                      borderRadius: BorderRadius.circular(20)),
                ),
                Positioned(
                    child: Container(
                      height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
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
              onTap: () async {
                if (!await launchUrl(urlgangotri,
                    mode: LaunchMode.externalApplication)) {
                  throw Exception('Could not launch $urlgangotri');
                }
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
                      borderRadius: BorderRadius.circular(20)),
                ),
                Positioned(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/overlay_pic.png",
                          height: MediaQuery.of(context).size.width * .22,
                          width: MediaQuery.of(context).size.width * .22,
                          fit: BoxFit.cover,
                          opacity: const AlwaysStoppedAnimation(.6),
                        ))),
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
              onTap: () async {
                if (!await launchUrl(urlbadri,
                    mode: LaunchMode.externalApplication)) {
                  throw Exception('Could not launch $urlbadri');
                }
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
                      borderRadius: BorderRadius.circular(20)),
                ),
                Positioned(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/overlay_pic.png",
                          height: MediaQuery.of(context).size.width * .22,
                          width: MediaQuery.of(context).size.width * .22,
                          fit: BoxFit.cover,
                          opacity: const AlwaysStoppedAnimation(.6),
                        ))),
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
              onTap: () async {
                if (!await launchUrl(urlyamnotri,
                    mode: LaunchMode.externalApplication)) {
                  throw Exception('Could not launch $urlyamnotri');
                }
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
                      borderRadius: BorderRadius.circular(20)),
                ),
                Positioned(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/overlay_pic.png",
                          height: MediaQuery.of(context).size.width * .22,
                          width: MediaQuery.of(context).size.width * .22,
                          fit: BoxFit.cover,
                          opacity: const AlwaysStoppedAnimation(.6),
                        ))),
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
              onTap: () async {
                if (!await launchUrl(urlguptkashi,
                    mode: LaunchMode.externalApplication)) {
                  throw Exception('Could not launch $urlguptkashi');
                }
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
                      borderRadius: BorderRadius.circular(20)),
                ),
                Positioned(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/overlay_pic.png",
                          height: MediaQuery.of(context).size.width * .22,
                          width: MediaQuery.of(context).size.width * .22,
                          fit: BoxFit.cover,
                          opacity: const AlwaysStoppedAnimation(.6),
                        ))),
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  child: Center(
                    child: Text(
                      "Guptkashi",
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
              onTap: () async {
                if (!await launchUrl(urlbarkot,
                    mode: LaunchMode.externalApplication)) {
                  throw Exception('Could not launch $urlbarkot');
                }
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
                      borderRadius: BorderRadius.circular(20)),
                ),
                Positioned(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/overlay_pic.png",
                          height: MediaQuery.of(context).size.width * .22,
                          width: MediaQuery.of(context).size.width * .22,
                          fit: BoxFit.cover,
                          opacity: const AlwaysStoppedAnimation(.6),
                        ))),
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  child: Center(
                    child: Text(
                      "Barkot",
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
              onTap: () async {
                if (!await launchUrl(urlsrinagar,
                    mode: LaunchMode.externalApplication)) {
                  throw Exception('Could not launch $urlsrinagar');
                }
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
                      borderRadius: BorderRadius.circular(20)),
                ),
                Positioned(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/overlay_pic.png",
                          height: MediaQuery.of(context).size.width * .22,
                          width: MediaQuery.of(context).size.width * .22,
                          fit: BoxFit.cover,
                          opacity: const AlwaysStoppedAnimation(.6),
                        ))),
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  child: Center(
                    child: Text(
                      "Srinagar",
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
              onTap: () async {
                if (!await launchUrl(urluttarkashi,
                    mode: LaunchMode.externalApplication)) {
                  throw Exception('Could not launch $urluttarkashi');
                }
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
                      borderRadius: BorderRadius.circular(20)),
                ),
                Positioned(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/overlay_pic.png",
                          height: MediaQuery.of(context).size.width * .22,
                          width: MediaQuery.of(context).size.width * .22,
                          fit: BoxFit.cover,
                          opacity: const AlwaysStoppedAnimation(.6),
                        ))),
                Container(
                  height: MediaQuery.of(context).size.width * .22,
                  width: MediaQuery.of(context).size.width * .22,
                  child: Center(
                    child: Text(
                      "Uttarkashi",
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
      ],
    );
  }
}
