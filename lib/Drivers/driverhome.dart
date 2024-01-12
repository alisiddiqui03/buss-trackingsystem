import 'package:flutter/material.dart';
import 'package:fyp/Drivers/dchangepassword.dart';
import 'package:fyp/Drivers/drivermenu.dart';
import 'package:fyp/Drivers/drouteview.dart';
import 'package:fyp/Drivers/login.dart';

// ignore: camel_case_types
class driverhome extends StatefulWidget {
  const driverhome({super.key});

  @override
  State<driverhome> createState() => _driverhomeState();
}

// ignore: camel_case_types
class _driverhomeState extends State<driverhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(188, 10, 15, 1),
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
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
                    image: AssetImage('assets/images/logo.png'),
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
                  Navigator.pop(context);
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
                    MaterialPageRoute(
                        builder: (context) => const Driverrouteview()),
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
                    MaterialPageRoute(
                        builder: (context) => const Driverchangepassword()),
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
                    MaterialPageRoute(
                        builder: (context) => const driverlogin()),
                  );
                },
              ),
            ],
          ),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(children: [
                    Text(
                      'Hello,Driver',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    Image(
                        image: AssetImage('assets/images/emoji.png'),
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
                          height: 155,
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
                                    padding: EdgeInsets.fromLTRB(44, 30, 0, 0),
                                    child: Text(
                                      'Pickup point',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 30, 0, 0),
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
                                  padding: EdgeInsets.fromLTRB(44, 30, 0, 0),
                                  child: Text(
                                    'Drop-off-point',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 30, 0, 0),
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
                          height: 155,
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
                                    padding: EdgeInsets.fromLTRB(44, 30, 0, 0),
                                    child: Text(
                                      'Arrival Time',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 30, 0, 0),
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
                                  padding: EdgeInsets.fromLTRB(35, 30, 0, 0),
                                  child: Text(
                                    'Departure time',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 30, 0, 0),
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
              Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 162,
                          height: 34,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                // side: BorderSide(color: Colors.red)
                              ),
                              backgroundColor:
                                  const Color.fromRGBO(245, 245, 245, 1),
                            ),
                            child: const Text(
                              'Start Route',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Driverrouteview()),
                              );
                            },
                          )),
                      const SizedBox(width: 12),
                      SizedBox(
                          width: 162,
                          height: 34,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                // side: BorderSide(color: Colors.red)
                              ),
                              backgroundColor:
                                  const Color.fromRGBO(245, 245, 245, 1),
                            ),
                            child: const Text(
                              'End Route',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Driverrouteview()),
                              );
                            },
                          )),
                    ],
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 8),
                  SizedBox(
                      width: 162,
                      height: 34,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            // side: BorderSide(color: Colors.red)
                          ),
                          backgroundColor:
                              const Color.fromRGBO(245, 245, 245, 1),
                        ),
                        child: const Text(
                          'Report Situation',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const drivermenu()),
                          );
                        },
                      )),
                ],
              )
            ],
          ),
        )));
  }
}
