import 'package:flutter/material.dart';
import 'package:zymohome/screens/Drawer/About_us.dart';
import 'package:zymohome/screens/Drawer/contactpage.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey[900],
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Color(0xFFedff8d),
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.black),
            title: Text('About Us', style: TextStyle(color: Color(0xFFedff8d))),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail, color: Colors.black),
            title:
                Text('Contact Us', style: TextStyle(color: Color(0xFFedff8d))),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactUsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
