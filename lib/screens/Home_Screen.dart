import 'package:flutter/material.dart';
import 'package:zymohome/screens/Drawer/add_drawer.dart';
import 'package:zymohome/widgets/Booking_widget.dart';
import 'package:zymohome/widgets/home_Screen_widgets.dart';
import 'package:zymohome/widgets/socila_media_link.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        // Increased AppBar height
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Image.asset('assets/zymoo.png', height: 55),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Drive Your Dreams\nwith Zymo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Experience the future of car rentals.\nBook, drive, and explore with ease.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              OnBoardingCarousel(),
              SizedBox(height: 60),
              BookingWidget(),
              SizedBox(height: 40),
              Text(
                'Service Provider',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              BrandImagesWidget(),
              SizedBox(height: 20),
              SocialMediaLinks(),
            ],
          ),
        ),
      ),
    );
  }
}
