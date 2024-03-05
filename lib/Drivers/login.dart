import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/Drivers/drivermenu.dart';
import 'package:fyp/Drivers/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class driverlogin extends StatefulWidget {
  const driverlogin({super.key});

  @override
  State<driverlogin> createState() => _driverloginState();
}

// ignore: camel_case_types
class _driverloginState extends State<driverlogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                content: Text('Are you sure you want to exit app?'),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('No'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Close the application when "Yes" is pressed
                      SystemNavigator.pop(); // This will close the app
                    },
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
            body: Center(
                child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                      labelText: 'Enter email',
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
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: const BoxDecoration(),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      labelText: 'Enter password',
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
              const SizedBox(height: 30),
              InkWell(
                  onTap: () {
                    _login();
                  },
                  child: Container(
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
                        onPressed: () {
                          _login();
                        },
                      ))),
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
                        MaterialPageRoute(
                            builder: (context) => const register()),
                      );
                    },
                  )
                ],
              ),
            ]),
          ),
        ))));
  }

  void _login() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    if (_formKey.currentState!.validate()) {
      try {
        await auth.signInWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString(),
        );

        Fluttertoast.showToast(
          msg: 'Login successful.',
          toastLength: Toast.LENGTH_SHORT,
        );

        // Navigate to another page when login is successful
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const drivermenu(),
          ),
        );
      } catch (e) {
        print('Login failed: $e');
        Fluttertoast.showToast(
          msg: 'Login failed. Please check your credentials and try again.',
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
