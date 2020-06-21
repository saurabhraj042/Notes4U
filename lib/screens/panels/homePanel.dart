import 'package:flutter/material.dart';
import 'package:notes4u/models/sem.dart';
import 'package:notes4u/screens/semEight.dart';
import 'package:notes4u/screens/semFive.dart';
import 'package:notes4u/screens/semFour.dart';
import 'package:notes4u/screens/semOne.dart';
import 'package:notes4u/screens/semSeven.dart';
import 'package:notes4u/screens/semSix.dart';
import 'package:notes4u/screens/semThree.dart';
import 'package:notes4u/screens/semTwo.dart';

class HomePanel extends StatelessWidget {
  // List of Semesters for the HomePage
  final List<Semester> data = [
    new Semester(
      semName: 'Semester I',
      onPressedFN: SemOne(),
    ),
    new Semester(
      semName: 'Semester II',
      onPressedFN: SemTwo(),
    ),
    new Semester(
      semName: 'Semester III',
      onPressedFN: SemThree(),
    ),
    new Semester(
      semName: 'Semester IV',
      onPressedFN: SemFour(),
    ),
    new Semester(
      semName: 'Semester V',
      onPressedFN: SemFive(),
    ),
    new Semester(
      semName: 'Semester VI',
      onPressedFN: SemSix(),
    ),
    new Semester(
      semName: 'Semester VII',
      onPressedFN: SemSeven(),
    ),
    new Semester(
      semName: 'Semester VIII',
      onPressedFN: SemEight(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // Widget  for HomePage
    return Container(
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
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => data[index].onPressedFN),
                        )
                      },
                      color: const Color(0xffD1C4E9),
                      child: Text(
                        data[index].semName,
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
    );
  }
}
