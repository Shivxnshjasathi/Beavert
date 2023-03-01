import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../Contsints/colors.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  _Home_screen createState() => _Home_screen();
}

class _Home_screen extends State<Home_screen> {
  List MyBeat_Types = [];

  Future getBeatTypes() async {
    await FirebaseFirestore.instance
        .collection("Beat_Categories")
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((element) {
                //print(element.data());
                var a = element.data();
                MyBeat_Types.add(a["Beat_Type"]);

                // MyBeat_Types.add(a["Beat_Type"]);
                //print(MyBeat_Types);
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
