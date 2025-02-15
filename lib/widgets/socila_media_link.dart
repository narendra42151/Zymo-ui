import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Ensure you have this package in your pubspec.yaml
import 'package:url_launcher/url_launcher.dart'; // Ensure you have this package in your pubspec.yaml

final appColor = Color(0xFFedff8d);
Color? darkGrey = Colors.grey[900];
Color? darkGrey2 = Colors.grey[800];
const black = Colors.black;
const white = Colors.white;

class SocialMediaLinks extends StatelessWidget {
  const SocialMediaLinks({Key? key}) : super(key: key);

  // Function to launch URLs
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkGrey, // Use darkGrey2 for the background
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Center(
            child: Text(
              "CONNECT WITH US", // Fixed typo in the text
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: appColor), // Use appColor for the text
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.facebook,
                  color: appColor,
                ),
                onPressed: () {
                  _launchURL('https://www.facebook.com/yourcompany');
                },
              ),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.instagram,
                  color: appColor,
                ),
                onPressed: () {
                  _launchURL('https://www.instagram.com/yourcompany');
                },
              ),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.linkedin,
                  color: appColor,
                ),
                onPressed: () {
                  _launchURL('https://www.linkedin.com/company/yourcompany');
                },
              ),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.twitter,
                  color: appColor,
                ),
                onPressed: () {
                  _launchURL('https://twitter.com/yourcompany');
                },
              ),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.youtube,
                  color: appColor,
                ),
                onPressed: () {
                  _launchURL('https://www.youtube.com/channel/yourchannel');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
