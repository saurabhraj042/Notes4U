import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes4u/screens/info.dart';
import 'package:notes4u/screens/panels/homePanel.dart';

import '../main.dart';

var appBarText = new RichText(
  text: new TextSpan(
    style: new TextStyle(
      fontSize: 25.0,
      letterSpacing: 1,
      color: const Color(0xffFFFFFF),
      fontWeight: FontWeight.bold,
    ),
    children: <TextSpan>[
      new TextSpan(text: 'Notes'),
      new TextSpan(
          text: '4U',
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            color: const Color(0xff212121),
          )),
    ],
  ),
);

class HomeScreen extends StatelessWidget {
  final UserDetails detailsUser;

  HomeScreen({this.detailsUser});

  @override
  Widget build(BuildContext context) {
    final GoogleSignIn _gSignIn = GoogleSignIn();
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: appBarText,
          backgroundColor: const Color(0xff512DA8),
          elevation: 20,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.infoCircle,
              size: 20.0,
              color: Colors.white,
            ),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoPage()),
              )
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.signOutAlt,
                size: 20.0,
                color: Colors.white,
              ),
              onPressed: () {
                _gSignIn.signOut();
                print('Signed out');
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: HomePanel(),
      ),
    );
  }
}
