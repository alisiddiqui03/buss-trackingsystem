import 'package:flutter/material.dart';

import 'forgetpassword.dart';
import 'home.dart';
import 'login.dart';
import 'setshedulel.dart';

class Routeview extends StatefulWidget {
  const Routeview({super.key});

  @override
  State<Routeview> createState() => _RouteviewState();
}

class _RouteviewState extends State<Routeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(188, 10, 15, 1),
        title: const Text('Route View'),
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
      body:  Stack(
        fit: StackFit.expand,
        children: [
          Flexible( // or Expanded
            child: Image.asset(
              'assets/map.png', // Replace with your image path
            fit: BoxFit.cover,
            ),
          ),]),
    );
    
  }
}