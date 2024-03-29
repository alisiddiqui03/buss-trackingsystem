import 'package:flutter/material.dart';
import 'package:fyp/Students/forgetpassword.dart';
import 'package:fyp/Students/home.dart';
import 'package:fyp/Students/login.dart';
import 'package:fyp/Students/routeview.dart';
import 'package:fyp/Students/setshedulel.dart';

// ignore: camel_case_types
class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

// ignore: camel_case_types
class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // Show a dialog to confirm exit
          bool confirmExit = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Confirm Exit'),
                content: Text('Are you sure you want to exit?'),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('No'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text('Yes'),
                  ),
                ],
              );
            },
          );

          // Return false to allow navigation back to login page if not confirmed
          // Return true to prevent navigation back to login page if confirmed
          return confirmExit ?? false;
        },
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            body: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  const SizedBox(height: 70),
                  Row(children: [
                    Image(
                        image: const AssetImage('assets/images/logo.png'),
                        height: 250,
                        width: MediaQuery.of(context).size.width)
                  ]),
                  const Row(
                    children: [
                      SizedBox(width: 15),
                      Text(
                        'Menu',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(0, 0, 0, 0.72)),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const SizedBox(width: 12),
                      const Image(
                          image: AssetImage('assets/images/m1.png'),
                          height: 30),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HOME()),
                              );
                            },
                            child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Home',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ))),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const SizedBox(width: 12),
                      const Image(
                          image: AssetImage('assets/images/m2.png'),
                          height: 30),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MapIntegerate()),
                              );
                            },
                            child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Route View',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ))),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const SizedBox(width: 12),
                      const Image(
                          image: AssetImage('assets/images/m3.png'),
                          height: 30),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const shedule()),
                              );
                            },
                            child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Shedule',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ))),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const SizedBox(width: 12),
                      const Image(
                          image: AssetImage('assets/images/m4.png'),
                          height: 30),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const forgetpassword()),
                              );
                            },
                            child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Change Password',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ))),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const SizedBox(width: 12),
                      const Image(
                          image: AssetImage('assets/images/m5.png'),
                          height: 30),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const login()),
                              );
                            },
                            child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ))),
                      )
                    ],
                  ),
                ]))));
  }
}
