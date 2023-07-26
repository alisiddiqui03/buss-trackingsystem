import 'package:flutter/material.dart';
import 'package:fyp/Drivers/drivermenu.dart';
import 'package:fyp/Drivers/register.dart';

// ignore: camel_case_types
class driverlogin extends StatefulWidget {
  const driverlogin({super.key});

  @override
  State<driverlogin> createState() => _driverloginState();
}

// ignore: camel_case_types
class _driverloginState extends State<driverlogin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:  
       Center(
       child: 
       SingleChildScrollView(child: 
       Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [   
        
          const Text('Welcome Back!',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),),
      
            Row(
            mainAxisAlignment: MainAxisAlignment.center,  
            children: [
              Image(image: 
          const AssetImage('assets/bus.png'),
          height:  300,
          width:  MediaQuery.of(context).size.width

          )

            ],),
      
        
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              
              child: TextField(
                obscureText: true,
                controller: passwordController,
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
            const SizedBox(height: 15),
             Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),  
            
              decoration: const BoxDecoration(
                
              ),
              child: TextField(
                controller: nameController,
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
            const SizedBox(height: 30),
        
              Container(
                margin: const EdgeInsets.only(top: 7),
                 padding: const EdgeInsets.fromLTRB(10, 0, 10, 0), 
                
                width: 318,
                height: 59,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                   shape:RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
     // side: BorderSide(color: Colors.red)
    ),
  
                backgroundColor: const Color.fromRGBO(188, 10, 15, 1),),
                  child: const Text('Login',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
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
                const Text('Dont have an account ?'),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 18,color: Color.fromRGBO(188, 10, 15, 1),fontWeight: FontWeight.w600
),
                  ),
              onPressed: () {
                  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const register()
    ),
  );
                  },
                )
              ],
            ),
       ]), )
       )

    );
  }
}