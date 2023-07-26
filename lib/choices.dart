import 'package:flutter/material.dart';
import 'package:fyp/Drivers/register.dart';
import 'package:fyp/Students/signup.dart';

// ignore: camel_case_types
class choice extends StatefulWidget {
  const choice({super.key});

  @override
  State<choice> createState() => _choiceState();
}

// ignore: camel_case_types
class _choiceState extends State<choice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children:  [ 
            SizedBox(
                width: 318,
                height: 79,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                   shape:RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
     // side: BorderSide(color: Colors.red)
    ),
  
                backgroundColor: const Color.fromRGBO(188, 10, 15, 1),),
                  child: const Text('STUDENTS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                  onPressed: () {
                  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const Students()
    ),
  );
                  },
                )
            ),
            ]),
            const SizedBox(height: 20)
,            Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children:  [ 
            SizedBox(
                width: 318,
                height: 79,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                   shape:RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
     // side: BorderSide(color: Colors.red)
    ),
  
                backgroundColor: const Color.fromRGBO(188, 10, 15, 1),),
                  child: const Text('DRIVERS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                  onPressed: () {
                  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const register()
    ),
  );
                  },
                )
            ),
            ]),
            const SizedBox(height: 20),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children:  [ 
            SizedBox(
                width: 318,
                height: 79,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                   shape:RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
     // side: BorderSide(color: Colors.red)
    ),
  
                backgroundColor: const Color.fromRGBO(188, 10, 15, 1),),
                  child: const Text('ADMIN',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                  onPressed: () {
                  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const choice()
    ),
  );
                  },
                )
            ),
            ])
        ],
      ),
    );
  }
}