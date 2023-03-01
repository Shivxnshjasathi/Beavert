import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Contsints/colors.dart';

class Search_screen extends StatefulWidget {
  const Search_screen({Key? key}) : super(key: key);

  @override
  _Search_screen createState() => _Search_screen();
}

class _Search_screen extends State<Search_screen> {
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
    return Scaffold(
      backgroundColor: bgcolors,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.height / 1.01,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Expanded(
                    child: FutureBuilder(
                  future: getBeatTypes(),
                  builder: (context, snapshot) {
                    return GridView.builder(
                        itemCount: MyBeat_Types.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.89,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 2.0),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {});
                              // Navigator.push(
                              //context,
                              // PageTransition(
                              // type: PageTransitionType.leftToRight, child: null,
                              // child: Wardrobe2(
                              // Myarray: [MyArray[0][selected_category]],
                              //key: Key("")),
                              //  ),
                              //);
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30)),
                                    color: Ascolors,
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              MyBeat_Types[index],
                                              style: GoogleFonts.alata(
                                                  color: bgcolors,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: bgcolors,
                                              size: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                )),
              ),
            ),
            //Padding(
            // padding: const EdgeInsets.symmetric(horizontal: 10.0),
            // child: Container( height: MediaQuery.of(context).size.height / 10,
            //     width: MediaQuery.of(context).size.height / 1.01,
            //    decoration: BoxDecoration(
            //        borderRadius: BorderRadius.circular(30),color: Ascolors)),
            //),
          ],
        ),
      ),
    );
  }
}
