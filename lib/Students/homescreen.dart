import 'package:flutter/material.dart';
import 'package:fyp/choices.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
              image: const AssetImage('assets/images/logo.png'),
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width),
        ]),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text('Get to university safe and',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                Text('sound, with our bus app around',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                Text('app around',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        // ignore: sized_box_for_whitespace
        Container(
            width: 318,
            height: 59,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  // side: BorderSide(color: Colors.red)
                ),
                backgroundColor: const Color.fromRGBO(188, 10, 15, 1),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const choice()),
                );
              },
            )),
      ])),
    );
  }
}
