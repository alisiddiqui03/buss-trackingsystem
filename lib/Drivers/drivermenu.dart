import 'package:flutter/material.dart';
import 'package:fyp/Drivers/dchangepassword.dart';
import 'package:fyp/Drivers/driverhome.dart';
import 'package:fyp/Drivers/drouteview.dart';
import 'package:fyp/Drivers/login.dart';

// ignore: camel_case_types
class drivermenu extends StatefulWidget {
  const drivermenu({super.key});

  @override
  State<drivermenu> createState() => _drivermenuState();
}

// ignore: camel_case_types
class _drivermenuState extends State<drivermenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                  image: AssetImage('assets/images/m1.png'), height: 30),
              const SizedBox(width: 20),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const driverhome()),
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
                  image: AssetImage('assets/images/m2.png'), height: 30),
              const SizedBox(width: 20),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Driverrouteview()),
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
                  image: AssetImage('assets/images/m4.png'), height: 30),
              const SizedBox(width: 20),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Driverchangepassword()),
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
                  image: AssetImage('assets/images/m5.png'), height: 30),
              const SizedBox(width: 20),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const driverlogin()),
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
        ])));
  }
}
