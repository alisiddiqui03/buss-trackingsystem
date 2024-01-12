import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/admin/admin_menu.dart';
import 'package:fyp/admin/admin_register.dart';

class adminlogin extends StatefulWidget {
  const adminlogin({super.key});

  @override
  State<adminlogin> createState() => _adminloginState();
}

class _adminloginState extends State<adminlogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Form(
        key: _formKey,
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
                        builder: (context) => const adminregister()),
                  );
                },
              )
            ],
          ),
        ]),
      ),
    )));
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

        //  Navigate to another page when login is successful
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const adminmenu(),
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
