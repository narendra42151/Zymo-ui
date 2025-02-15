import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

const appColor = Color(0xFFedff8d);
final List<Color> gradientColors = [
  appColor,
  Color(0xFF673AB7),
  Color(0xFF9C27B0)
];

class OnBoardingCarousel extends StatelessWidget {
  const OnBoardingCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> dummyImages = [
      "assets/1.jpg", // Dummy image 1
      "assets/2.jpg",
      "assets/3.jpg",
    ];

    return Column(
      children: [
        const SizedBox(height: 20),
        CarouselSlider(
          items: dummyImages.map((imageUrl) {
            return ClipRRect(
              borderRadius:
                  BorderRadius.circular(15), // Set the desired radius here
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            aspectRatio: 16 / 10,
            autoPlay: true,
            viewportFraction: 1,
            enlargeCenterPage: true,
          ),
        ),
      ],
    );
  }
}

// Make sure your pubspec.yaml has a recent carousel_slider version (e.g. ^4.2.0)

class BrandImagesWidget extends StatefulWidget {
  const BrandImagesWidget({Key? key}) : super(key: key);

  @override
  _BrandImagesWidgetState createState() => _BrandImagesWidgetState();
}

class _BrandImagesWidgetState extends State<BrandImagesWidget> {
  final List<Map<String, dynamic>> dummyBrands = [
    {'path': 'assets/s1.png', 'name': 'Avis', 'isFirebase': false},
    {'path': 'assets/s2.png', 'name': 'Wheelup', 'isFirebase': false},
    {'path': 'assets/s3.png', 'name': 'Carronrent', 'isFirebase': false},
    {'path': 'assets/8.jpg', 'name': 'Rnex', 'isFirebase': false},
    {'path': 'assets/s5.png', 'name': 'Doorcars', 'isFirebase': false},
    {'path': 'assets/s6.png', 'name': 'Zoomcars', 'isFirebase': false},
  ];

  // Updated controller type
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % dummyBrands.length;
          // Added required parameters
          _carouselController.animateToPage(
            _currentIndex,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.20,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: CarouselSlider(
            carouselController: _carouselController, // Now compatible
            options: CarouselOptions(
              height: height * 0.17,
              autoPlay: false,
              viewportFraction: 0.45,
              enlargeCenterPage: false,
              scrollPhysics: const NeverScrollableScrollPhysics(),
              enableInfiniteScroll: true,
            ),
            items: dummyBrands.map((brand) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: height * 0.14,
                    height: height * 0.14,
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Padding(
                      padding: EdgeInsets.all(height * 0.015),
                      child: brand['isFirebase'] == true
                          ? Image.network(brand['path'] as String,
                              fit: BoxFit.contain)
                          : Image.asset(brand['path'] as String,
                              fit: BoxFit.cover),
                    ),
                  ),
                  Text(
                    brand['name'] as String,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
