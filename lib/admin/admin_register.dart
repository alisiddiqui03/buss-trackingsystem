import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/admin/admin_login.dart';
import 'package:fyp/admin/admin_menu.dart';

class adminregister extends StatefulWidget {
  const adminregister({super.key});

  @override
  State<adminregister> createState() => _adminregisterState();
}

class _adminregisterState extends State<adminregister> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome Onboard!',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Stay on track with Suffa bus tracking',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color.fromRGBO(0, 0, 0, 0.72)),
              )
            ],
          ),

          const Padding(padding: EdgeInsets.only(bottom: 30)),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  labelText: 'Enter Your name',
                  filled: true, //<-- SEE HERE
                  fillColor: const Color.fromRGBO(238, 238, 238, 1)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  labelText: 'Enter Your email',
                  filled: true, //<-- SEE HERE
                  fillColor: const Color.fromRGBO(238, 238, 238, 1)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  labelText: 'Enter Your password',
                  filled: true, //<-- SEE HERE
                  fillColor: const Color.fromRGBO(238, 238, 238, 1)),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          //   child: TextField(
          //     obscureText: true,
          //     controller: passwordController,
          //     decoration: InputDecoration(
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(50),
          //         ),
          //         labelText: 'Confirm Password',
          //         filled: true, //<-- SEE HERE
          //         fillColor: const Color.fromRGBO(238, 238, 238, 1)),
          //   ),
          // ),
          const Padding(padding: EdgeInsets.only(bottom: 50)),

          // ignore: sized_box_for_whitespace
          Container(
            margin: const EdgeInsets.only(top: 7),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: 318,
            height: 59,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                backgroundColor: const Color.fromRGBO(188, 10, 15, 1),
              ),
              child: const Text(
                'Register',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                _signUp();
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Already have an account ?'),
              TextButton(
                child: const Text(
                  'Sign in',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(188, 10, 15, 1),
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const adminlogin()),
                  );
                },
              )
            ],
          ),
        ]),
      ),
    )));
  }

  void _signUp() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    if (_formKey.currentState!.validate()) {
      try {
        await auth.createUserWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString(),
        );

        await firestore.collection('admin').doc(auth.currentUser!.uid).set({
          'email': emailController.text.toString(),
          'password': passwordController.text.toString(),
        });

        Fluttertoast.showToast(
          msg: 'Signup successful. Account has been created.',
          toastLength: Toast.LENGTH_SHORT,
        );

        // Navigate only when signup is successful
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const adminmenu(),
          ),
        );
      } catch (e) {
        print('Signup failed: $e');
        Fluttertoast.showToast(
          msg: 'Signup failed. Please try again.',
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: 'Please enter data in all fields.',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }
}
