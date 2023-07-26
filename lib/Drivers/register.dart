import 'package:flutter/material.dart';
import 'package:fyp/Drivers/drivermenu.dart';
import 'package:fyp/Drivers/login.dart';

// ignore: camel_case_types
class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

// ignore: camel_case_types
class _registerState extends State<register> {
    TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
       child: 
       SingleChildScrollView(
        child:
       Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome Onboard!',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),)
          ],),
          const SizedBox(height: 10),
          const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Stay on track with Suffa bus tracking',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Color.fromRGBO(0, 0, 0, 0.72)),)
          ],),
                   
          const Padding(padding: EdgeInsets.only(bottom: 30)),

            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(50),
                   
                  ),
                  
                  labelText: 'Enter Your Full Name',
                   filled: true, //<-- SEE HERE
        fillColor: const Color.fromRGBO(238, 238, 238, 1)
                ),
              ),
            ),
             Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                
              ),
              child: TextField(
                controller: passwordController,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),

                  ),
                  labelText: 'Enter Password',
                    filled: true, //<-- SEE HERE
        fillColor: const Color.fromRGBO(238, 238, 238, 1)

                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
  
                  ),
                  labelText: 'Confirm Password',
                   filled: true, //<-- SEE HERE
        fillColor: const Color.fromRGBO(238, 238, 238, 1)
                ),
              ),
            ),
                  const Padding(padding: EdgeInsets.only(bottom: 50)),

          
              // ignore: sized_box_for_whitespace
              Container(
                width: 318,
                height: 59,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                   shape:RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
     // side: BorderSide(color: Colors.red)
    ),
  
                backgroundColor: const Color.fromRGBO(188, 10, 15, 1),),
                  child: const Text('Register',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                  onPressed: () {
                  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const drivermenu()
    ),
  );
                  },
                )
       ),
        Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Already have an account ?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 18,color: Color.fromRGBO(188, 10, 15, 1),fontWeight: FontWeight.w600
),
                  ),
              onPressed: () {
                  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const driverlogin()
    ),
  );
                  },
                )
              ],
            ),

       ]), ))
    );
  }
}