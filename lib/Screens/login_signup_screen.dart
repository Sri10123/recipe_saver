import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'Login_Screen.dart';

// ignore: camel_case_types
class login_signup_screen extends StatefulWidget {
  @override
  _login_signup_screenState createState() => _login_signup_screenState();
}

// ignore: camel_case_types
class _login_signup_screenState extends State<login_signup_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => login_screen()));
              },
              child: Container(
                height: 75,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                  child: Text(
                      "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 50,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp_Screen()));
              },
              child: Container(
                height: 75,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                  child: Text(
                      "Sign Up",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
