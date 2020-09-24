import 'package:flutter/material.dart';
import 'login_signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(
            "Recipe Saver",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.blueGrey[900],
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 40,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "to",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,),
                    child: Text(
                      "Recipe Saver",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: Colors.blueGrey[900],
              child: Padding(
                padding: EdgeInsets.only(top: 5,bottom: 10,),
                child: Image.asset("images/recipe_saver_logo.png"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => login_signup_screen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 125,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Text(
                        "Click here to get started ->",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey[900],
                        ),
                      ),
                    ),
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
