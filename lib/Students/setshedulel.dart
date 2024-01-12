import 'package:flutter/material.dart';
import 'package:fyp/Students/home.dart';
import 'package:fyp/Students/routeview.dart';

import 'forgetpassword.dart';
import 'login.dart';

// ignore: camel_case_types
class shedule extends StatefulWidget {
  const shedule({super.key});

  @override
  State<shedule> createState() => _sheduleState();
}

// ignore: camel_case_types
class _sheduleState extends State<shedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(188, 10, 15, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(188, 10, 15, 1),
        title: const Text('Set Shedule', style: TextStyle(color: Colors.white)),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HOME()),
                  );
                }),
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
                  MaterialPageRoute(
                      builder: (context) => const forgetpassword()),
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
      body: Column(children: [
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 219, 21, 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          '25 April 2023',
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.w600),
                        )),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                      ),
                      child: Text(
                        'Route',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 20, right: 30),
                        child: Container(
                            width: 150,
                            height: 38,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'North Karachi',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            )))
                  ],
                ),
                Expanded(
                  child: Container(
                      // height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25),
                            Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(188, 10, 15, 0.2),
                                  borderRadius: BorderRadius.circular(7)),
                              child: const Center(
                                child: Text(
                                  'Johar To Dha Suffa University',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            StopRow('7:30 AM', 'Stop1'),
                            const SizedBox(
                              height: 40,
                            ),
                            StopRow('7:45 AM', 'Stop2'),
                            const SizedBox(
                              height: 40,
                            ),
                            StopRow('8:00 AM', 'Stop3'),
                            const SizedBox(
                              height: 40,
                            ),
                            StopRow('8:15 AM', 'Stop4'),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                                height: 30,
                                width: 160,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromARGB(
                                              255, 202, 195, 195),
                                          blurRadius: 2,
                                          spreadRadius: 1,
                                          offset: Offset(0,
                                              5)), // no shadow color set, defaults to black
                                      // BoxShadow(color: Colors.white, offset: Offset(0, 0)),
                                      //               BoxShadow(color: Colors.white, offset: Offset(0, 0)),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(17)),
                                child: const Row(
                                  children: [
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Icon(Icons.phone,
                                        color: Color.fromRGBO(255, 219, 21, 1)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Call to driver",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

// ignore: non_constant_identifier_names
Widget StopRow(String time, String stop) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          time,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 21),
        ),
        Container(
          height: 30,
          width: 180,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(188, 10, 15, 0.2),
              borderRadius: BorderRadius.circular(17)),
          child: Center(
            child: Text(
              stop,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ),
      ],
    ),
  );
}
