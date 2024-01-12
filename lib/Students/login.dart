import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Students/forgetpassword.dart';
import 'package:fyp/Students/menu.dart';
import 'package:fyp/Students/signup.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String errorMessage = "";
  bool showError = false;
  final formkey = GlobalKey<FormState>();
  bool showSpinner = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

  void login() {
    // setState(() {
    //   showSpinner = true;
    // });
    log(emailController.text.toString() + passwordController.text.toString());
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      // Utils().toastMessag("Sign In Sucessfully");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const menu()));
      // setState(() {
      //   showSpinner = false;
      // });
    }).onError((error, stackTrace) {
      // Utils().toastMessag(error.toString());
      // setState(() {
      //   showSpinner = false;
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Form(
        key: formkey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Welcome Back!',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: const AssetImage('assets/images/bus.png'),
                  height: 300,
                  width: MediaQuery.of(context).size.width)
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextFormField(
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
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: const BoxDecoration(),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  labelText: 'Enter Password',
                  filled: true, //<-- SEE HERE
                  fillColor: const Color.fromRGBO(238, 238, 238, 1)),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const forgetpassword()),
                  );
                },
                child: const Text(
                  'Forget Password',
                  style: TextStyle(
                      color: Color.fromRGBO(188, 10, 15, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
              margin: const EdgeInsets.only(top: 7),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white),
                ),
                onPressed: () async {
                  log(emailController.text.toString() +
                      passwordController.text.toString());
                  login();
                  // if (emailController.text.isEmpty ||
                  //     passwordController.text.isEmpty) {
                  //   Fluttertoast.showToast(
                  //     msg: "Please fill in all the required fields.",
                  //     toastLength: Toast.LENGTH_SHORT,
                  //   );
                  // }

                  // try {
                  //   UserCredential userCredential =
                  //       await auth.signInWithEmailAndPassword(
                  //           email: emailController.text.toString(),
                  //           password: passwordController.text.toString());

                  //   String userEmail = userCredential.user?.email ?? 'unknown';
                  //   String successMessage =
                  //       'Login successful for user: $userEmail';
                  //   Fluttertoast.showToast(
                  //     msg: successMessage,
                  //     toastLength: Toast.LENGTH_SHORT,
                  //   );

                  //   // If the authentication is successful, navigate to the next page (Home Page).
                  //   if (userCredential.user != null) {
                  //     // ignore: use_build_context_synchronously
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => const menu()),
                  //     );
                  //   }
                  //   String uid = userCredential.user!.uid;
                  //   DocumentSnapshot userSnapshot = await FirebaseFirestore
                  //       .instance
                  //       .collection('users')
                  //       .doc(uid)
                  //       .get();

                  //   if (userSnapshot.exists) {
                  //     setState(() {
                  //       _userName = userSnapshot.get('name');
                  //     });
                  //     String successMessage =
                  //         'Welcome, $_userName! You have successfully logged in.';
                  //     Fluttertoast.showToast(
                  //       msg: successMessage,
                  //       toastLength: Toast.LENGTH_LONG,
                  //     );
                  //   } else {
                  //     // ignore: avoid_print
                  //     print('User data not found in Firestore.');
                  //   }

                  //   // ignore: avoid_print
                  //   print('Login successful: ${userCredential.user?.email}');
                  // } catch (e) {
                  //   // ignore: avoid_print
                  //   print('Login failed: $e');
                  //   // Show the error message on the screen using a Text widget or SnackBar
                  //   // Here, we're using the `fluttertoast` package to show a toast message.
                  //   Fluttertoast.showToast(
                  //     msg:
                  //         "Login failed. Please check your email and password.",
                  //     toastLength: Toast.LENGTH_SHORT,
                  //   );
                  // }
                },
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Dont have an account ?'),
              TextButton(
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(188, 10, 15, 1),
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Students()),
                  );
                },
              )
            ],
          ),
        ]),
      ),
    )));
  }
}
