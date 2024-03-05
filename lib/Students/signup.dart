import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/Students/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'menu.dart';

class Students extends StatefulWidget {
  const Students({super.key});

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late String password;
  late String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: Form(
      key: formKey,
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
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                labelText: 'Enter Your Full Name',
                filled: true, //<-- SEE HERE
                fillColor: const Color.fromRGBO(238, 238, 238, 1)),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                labelText: 'Enter Your Email',
                filled: true, //<-- SEE HERE
                fillColor: const Color.fromRGBO(238, 238, 238, 1)),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(),
          child: TextFormField(
            controller: passwordController,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a password';
              }
              return null;
            },
            onSaved: (value) {
              password = value!;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                labelText: 'Enter Password',
                filled: true, //<-- SEE HERE
                fillColor: const Color.fromRGBO(238, 238, 238, 1)),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextFormField(
            obscureText: true,
            controller: confirmpasswordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
            onSaved: (value) {
              confirmPassword = value!;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                labelText: 'Confirm Password',
                filled: true, //<-- SEE HERE
                fillColor: const Color.fromRGBO(238, 238, 238, 1)),
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 50)),

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
                  'Register',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white),
                ),
                onPressed: () async {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  FirebaseFirestore firestore = FirebaseFirestore.instance;
                  if (nameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: "Please fill in all the required fields.",
                      toastLength: Toast.LENGTH_SHORT,
                    );
                    return; // Return without proceeding further
                  }
                  if (formKey.currentState!.validate())
                    formKey.currentState!.save();

                  try {
                    // ignore: unused_local_variable
                    UserCredential userCredential =
                        await auth.createUserWithEmailAndPassword(
                            email: emailController.text.toString(),
                            password: passwordController.text.toString());
                    firestore
                        .collection('users')
                        .doc(auth.currentUser!.uid)
                        .set({
                      'email': emailController.text.toString(),
                      'name': nameController.text.toString(),
                      'password': passwordController.text.toString()
                    });

                    // ignore: avoid_print
                    print('Signup successful: ${userCredential.user?.email}');
                  } catch (e) {
                    // ignore: avoid_print
                    print('Signup failed: $e');
                    Fluttertoast.showToast(
                      msg: "Signup successful. Account Has Been Created.",
                      toastLength: Toast.LENGTH_SHORT,
                    );

                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const menu()),
                    );
                    // After navigation, clear the text input fields
                    nameController.clear();
                    emailController.clear();
                    passwordController.clear();

                    // await FirebaseAuth.instance
                    //     .createUserWithEmailAndPassword(
                    //         email: emailController.text,
                    //         password: passwordController.text)
                    //     .then((value) {
                    //   Navigator.of(context)
                    //       .push(
                    //           MaterialPageRoute(builder: (context) => const menu()))
                    //       .onError((error, stackTrace) =>
                    //           {print("Error ${error.toString()}")});
                    // });
                  }
                })),
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
                  MaterialPageRoute(builder: (context) => const login()),
                );
              },
            )
          ],
        ),
      ]),
    ))));
  }
}
