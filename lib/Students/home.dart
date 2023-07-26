import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Students/forgetpassword.dart';
import 'package:fyp/Students/login.dart';
import 'package:fyp/Students/routeview.dart';
import 'package:fyp/Students/setshedulel.dart';

class HOME extends StatefulWidget {
  const HOME({super.key});

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  String name = "Name Loading";

  // final firestore = FirebaseFirestore.instance.collection('users').snapshots();

  void get() async {
    // ignore: await_only_futures
    User? user = await FirebaseAuth.instance.currentUser;
    // ignore: non_constant_identifier_names
    var get_name = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get();
    setState(() {
      name = get_name.data()!['name'];
    });
  }

  @override
  void initState() {
    get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(188, 10, 15, 1),
          title: const Text('Home'),
        ),
        drawer: Drawer(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                  )),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Colors.yellow,
                  size: 25,
                ),
                title: const Text('HOME',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HOME()),
                  );
                },
              ),
               ListTile(
                leading: const Icon(
                  Icons.map,
                  color: Colors.yellow,
                  size: 25,
                ),
                title: const Text('ROUTE VIEW',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
                 onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Routeview()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.calendar_month,
                  color: Colors.yellow,
                  size: 25,
                ),
                title: const Text('SHEDULE',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const shedule()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.key,
                  color: Colors.yellow,
                  size: 25,
                ),
                title: const Text('CHANGE PASSWORD',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const forgetpassword()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.yellow,
                  size: 25,
                ),
                title: const Text('LOGOUT',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
              onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const login()),
                  );
                },  
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(children: [
                    Text(
                      // ignore: unnecessary_brace_in_string_interps
                      "Hello, ${name}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const Image(
                        image: AssetImage('assets/emoji.png'),
                        height: 30,
                        width: 31),
                  ])),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to Suffa Bus Tracking System',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                          height: 181,
                          width: 325,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(188, 10, 15, 0.2),
                                offset: Offset(6.0, 6.0),
                              ),
                            ],
                          ),
                          child: Column(children: [
                            Row(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(44, 45, 0, 0),
                                    child: Text(
                                      'Pickup point',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 40, 0, 0),
                                    child: Container(
                                        height: 42,
                                        width: 154,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              offset: Offset(6.0, 6.0),
                                            ),
                                          ],
                                        ),
                                        child: const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(42, 19, 0, 0),
                                          child: Text('North Karachi',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700)),
                                        )))
                              ],
                            ),
                            Row(children: [
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(44, 45, 0, 0),
                                  child: Text(
                                    'Drop-off-point',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 40, 0, 0),
                                  child: Container(
                                      height: 42,
                                      width: 154,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                            offset: Offset(6.0, 6.0),
                                          ),
                                        ],
                                      ),
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 19, 0, 0),
                                        child: Text('Dha Suffa University',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700)),
                                      )))
                            ]),
                          ])))
                ],
              ),
              //SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                          height: 181,
                          width: 325,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(188, 10, 15, 0.2),
                                offset: Offset(6.0, 6.0),
                              ),
                            ],
                          ),
                          child: Column(children: [
                            Row(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(44, 45, 0, 0),
                                    child: Text(
                                      'Arrival Time',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 40, 0, 0),
                                    child: Container(
                                        height: 42,
                                        width: 154,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              offset: Offset(6.0, 6.0),
                                            ),
                                          ],
                                        ),
                                        child: const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(55, 19, 0, 0),
                                          child: Text('08:15 am',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700)),
                                        )))
                              ],
                            ),
                            Row(children: [
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(35, 45, 0, 0),
                                  child: Text(
                                    'Departure time',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 40, 0, 0),
                                  child: Container(
                                      height: 42,
                                      width: 154,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                            offset: Offset(6.0, 6.0),
                                          ),
                                        ],
                                      ),
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(55, 19, 0, 0),
                                        child: Text('06:30 pm',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700)),
                                      )))
                            ]),
                          ])))
                ],
              ),
            ],
          ),
        ));
  }
}
