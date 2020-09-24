import 'package:flutter/material.dart';
import 'package:recipe_saver/Views/home_view.dart';

// ignore: camel_case_types
class SignUp_Screen extends StatefulWidget {
  @override
  _SignUp_ScreenState createState() => _SignUp_ScreenState();
}

// ignore: camel_case_types
class _SignUp_ScreenState extends State<SignUp_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 35, left: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                  ),
                      ),
                    ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35, right: 15),
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Image.asset("images/recipe_saver_logo.png"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 100,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up Page",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey[900],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                      color: Colors.blueGrey[900],
                    ),
                    decoration: InputDecoration(
                      labelText: "Username",
                        labelStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey[900],
                        ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                      color: Colors.blueGrey[900],
                    ),
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey[900],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                      color: Colors.blueGrey[900],
                    ),
                    decoration: InputDecoration(
                      labelText: "Type Password Again",
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey[900],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 45,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
                  },
                  child: Container(
                    height: 65,
                    width: 125,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[900],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
