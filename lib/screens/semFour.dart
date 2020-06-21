import 'package:flutter/material.dart';
import 'package:notes4u/models/subject.dart';
import 'package:notes4u/services/launchUrl.dart';

var appBarText = new RichText(
  text: new TextSpan(
    style: new TextStyle(
      fontSize: 25.0,
      letterSpacing: 1,
      color: const Color(0xffFFFFFF),
      fontWeight: FontWeight.bold,
    ),
    children: <TextSpan>[
      new TextSpan(text: 'Semester'),
      new TextSpan(
          text: 'Four',
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            color: const Color(0xff212121),
          )),
    ],
  ),
);

class SemFour extends StatelessWidget {
  final List<Subjects> data = [
    new Subjects(subName: 'Subject I', url: 'https://www.youtube.com/'),
    new Subjects(subName: 'Subject II', url: 'https://www.facebook.com/'),
    new Subjects(subName: 'Subject III', url: 'https://www.google.com/'),
    new Subjects(subName: 'Subject IV', url: 'https://www.youtube.com/'),
    new Subjects(subName: 'Subject V', url: 'https://www.youtube.com/'),
    new Subjects(subName: 'Subject VI', url: 'https://www.youtube.com/'),
    new Subjects(subName: 'Subject VII', url: 'https://www.youtube.com/'),
    new Subjects(subName: 'Subject VIII', url: 'https://www.youtube.com/'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: appBarText,
        centerTitle: true,
        backgroundColor: const Color(0xff512DA8),
      ),
      body: Container(
        color: const Color(0xff673AB7),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListView.builder(
                padding: const EdgeInsets.all(50),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 80,
                      child: new RaisedButton(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: const Color(0xffD1C4E9)),
                        ),
                        onPressed: () => launchURL(url: data[index].url),
                        color: const Color(0xffD1C4E9),
                        child: Text(
                          data[index].subName,
                          style: TextStyle(
                            fontSize: 20,
                            color: const Color(0xff212121),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
