import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../Contsints/colors.dart';
import '../modal/user_modal.dart';
import 'Controller_screen.dart';

class Upload_screen extends StatefulWidget {
  const Upload_screen({Key? key}) : super(key: key);

  @override
  _Upload_screen createState() => _Upload_screen();
}

class _Upload_screen extends State<Upload_screen> {
  @override
  Widget build(BuildContext context) {
    Future<String?> adddata({
      String? id,
      String? Beatname,
      String? Beatbpm,
      String? Beatpitch,
      String? Lyric,
      String? Beatproducer,
      String? Beatduration,
      String? Beattype,
    }) async {
      String? userId = auth.FirebaseAuth.instance.currentUser?.uid;
      FirebaseFirestore _firestore = FirebaseFirestore.instance;

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('user_music_upload')
          .add({
        "id": userId,
        "Beatname": Beatname,
        "Beatbpm": Beatbpm,
        "Beatpitch": Beatpitch,
        "Lyric": Lyric,
        "Beatproducer": Beatproducer,
        "Beatduration": Beatduration,
        "Beattype": Beattype,
      });
    }

    final TextEditingController BeatnameController = TextEditingController();
    final TextEditingController BeatbpmController = TextEditingController();
    final TextEditingController BeatpitchController = TextEditingController();
    final TextEditingController LyricController = TextEditingController();
    final TextEditingController BeatproducerController =
        TextEditingController();
    final TextEditingController Beattype = TextEditingController();
    final TextEditingController BeatdurationController =
        TextEditingController();

    return Scaffold(
      backgroundColor: bgcolors,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(),
                    Row(children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 1.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Ascolors),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 120,
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Ascolors),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: TextField(
                                    controller: BeatnameController,
                                    style: GoogleFonts.alata(
                                      fontWeight: FontWeight.w100,
                                      color: bgcolors,
                                      fontSize: 40,
                                    ),
                                    decoration: InputDecoration(
                                      focusColor: Ascolors,
                                      border: InputBorder.none,
                                      labelText: "Name",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.white30, //color of divider
                              height: 0, //height spacing of divider
                              thickness: 0.5, //thickness of divier line
                              indent: 25, //spacing at the start of divider
                              endIndent: 25, //spacing at the end of divider
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width / 1.10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Ascolors),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: TextField(
                                    controller: BeatbpmController,
                                    style: GoogleFonts.alata(
                                      fontWeight: FontWeight.w100,
                                      color: bgcolors,
                                      fontSize: 20,
                                    ),
                                    decoration: InputDecoration(
                                      focusColor: Ascolors,
                                      border: InputBorder.none,
                                      labelText: "BPM",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.10,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 80,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Ascolors),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30.0),
                                        child: TextField(
                                          controller: BeatpitchController,
                                          style: GoogleFonts.alata(
                                            fontWeight: FontWeight.w100,
                                            color: bgcolors,
                                            fontSize: 20,
                                          ),
                                          decoration: InputDecoration(
                                            focusColor: Ascolors,
                                            border: InputBorder.none,
                                            labelText: "Pitch",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 80,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Ascolors),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: TextField(
                                        controller: BeatdurationController,
                                        style: GoogleFonts.alata(
                                          fontWeight: FontWeight.w100,
                                          color: bgcolors,
                                          fontSize: 20,
                                        ),
                                        decoration: InputDecoration(
                                          focusColor: Ascolors,
                                          border: InputBorder.none,
                                          labelText: "Duration",
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.10,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 80,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Ascolors),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30.0),
                                        child: TextField(
                                          controller: BeatproducerController,
                                          style: GoogleFonts.alata(
                                            fontWeight: FontWeight.w100,
                                            color: bgcolors,
                                            fontSize: 20,
                                          ),
                                          decoration: InputDecoration(
                                            focusColor: Ascolors,
                                            border: InputBorder.none,
                                            labelText: "Prod.",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 80,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Ascolors),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: TextField(
                                        controller: Beattype,
                                        style: GoogleFonts.alata(
                                          fontWeight: FontWeight.w100,
                                          color: bgcolors,
                                          fontSize: 20,
                                        ),
                                        decoration: InputDecoration(
                                          focusColor: Ascolors,
                                          border: InputBorder.none,
                                          labelText: "Type",
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            InkWell(
                              onTap: () async {
                                await adddata(
                                    id: currentUser?.uid,
                                    Beatbpm: BeatbpmController.text,
                                    Beatduration: BeatdurationController.text,
                                    Beatname: BeatnameController.text,
                                    Beatpitch: BeatpitchController.text,
                                    Beatproducer: BeatproducerController.text,
                                    Beattype: Beattype.text,
                                    Lyric: LyricController.text);
                                print("Uploaded");
                              },
                              child: Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: bgcolors),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Upload',
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.alata(
                                              fontWeight: FontWeight.w100,
                                              color: Ascolors,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            'Beat',
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.alata(
                                              fontWeight: FontWeight.bold,
                                              color: Ascolors,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.airplane_ticket,
                                        size: 35,
                                        color: Ascolors,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 1.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Ascolors),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.5,
                          width: MediaQuery.of(context).size.width / 1.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Ascolors),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 20),
                            child: TextField(
                              controller: LyricController,
                              style: GoogleFonts.alata(
                                fontWeight: FontWeight.w100,
                                color: bgcolors,
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                focusColor: Ascolors,
                                border: InputBorder.none,
                                labelText: "Add Lyric",
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 1.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Ascolors),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.5,
                          width: MediaQuery.of(context).size.width / 1.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Ascolors),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 20),
                            child: TextField(
                              controller: LyricController,
                              style: GoogleFonts.alata(
                                fontWeight: FontWeight.w100,
                                color: bgcolors,
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                focusColor: Ascolors,
                                border: InputBorder.none,
                                labelText: "Record Flow",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
