import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes4u/screens/homescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes4U',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff9C58D2),
      ),
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn(BuildContext context) async {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('Sign in'),
    ));

    final GoogleSignInAccount googleUser = await _googlSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser userDetails =
        (await _firebaseAuth.signInWithCredential(credential)).user;
    ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);

    List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = new UserDetails(
      userDetails.providerId,
      userDetails.displayName,
      userDetails.photoUrl,
      userDetails.email,
      providerData,
    );
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new HomeScreen(detailsUser: details),
      ),
    );
    return userDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10.0),
                Container(
                  width: 250.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: SizedBox(
                          height: 130,
                          width: 250,
                          child: Text(
                            "Hello \nThere,",
                            style: TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      OutlineButton(
                        borderSide: BorderSide(color: Colors.black),
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        color: Color(0xffffffff),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.google,
                              color: Color(0xffCE107C),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              'Sign in with Google',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                          ],
                        ),
                        onPressed: () => _signIn(context)
                            .then((FirebaseUser user) => print(user))
                            .catchError((e) => print(e)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails, this.userName, this.photoUrl,
      this.userEmail, this.providerData);
}

class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}
