import 'package:flutter/material.dart';
import 'package:fyp/Drivers/login.dart';

class Driverrouteview extends StatefulWidget {
  const Driverrouteview({super.key});

  @override
  State<Driverrouteview> createState() => _DriverrouteviewState();
}

class _DriverrouteviewState extends State<Driverrouteview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(188, 10, 15, 1),
        title: const Text(
          'Route View',
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
                Navigator.pop(context);
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
                  MaterialPageRoute(builder: (context) => const driverlogin()),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(fit: StackFit.expand, children: [
        // or Expanded
        Image.asset(
          'assets/images/map.png', // Replace with your image path
          fit: BoxFit.cover,
        ),
      ]),
    );
  }
}
