import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class SliderView extends StatefulWidget {
  const SliderView({Key? key}) : super(key: key);

  @override
  State<SliderView> createState() => _SliderState();
}

class _SliderState extends State<SliderView> {
  final CarouselController carouselController = CarouselController();
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    List imageList = [
      {"id": 1, "image_path": 'assets/images/kd3.jpg'},
      {"id": 2, "image_path": 'assets/images/kd1.jpg'},
      {"id": 3, "image_path": 'assets/images/kd2.jpg'},
      {"id": 4, "image_path": 'assets/images/kd3.jpg'},
      {"id": 5, "image_path": 'assets/images/kd5.jpg'},
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
          child: Stack(
            children: [
              InkWell(
                onTap: () {},
                child: CarouselSlider(
                  items: imageList
                      .map(
                        (item) => ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                      item['image_path'],
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                        ),
                  )
                      .toList(),
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: true,
                    aspectRatio: 2.3,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentindex = index;
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: currentindex == entry.key ? 12 : 7,
                        height: 7.0,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 3.0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentindex == entry.key
                                ? Colors.grey
                                : Colors.grey[200]),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
