import 'dart:io';
import 'package:flutter/material.dart';
import 'recipe_editor_screen.dart';

// ignore: must_be_immutable, camel_case_types
class saverecipes extends StatefulWidget {
  @override
  _saverecipesState createState() => _saverecipesState();
}
// ignore: camel_case_types
class _saverecipesState extends State<saverecipes> {

  List Containers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 35, right: 15),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              Containers.add('');
            });
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blueGrey, Colors.blueGrey[900]]
                )
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: Platform.isIOS? 60: 30, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Recipe",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Saver",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(vertical: Platform.isIOS? 120: 90),
            child: ListView.builder(
              itemCount: Containers.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecipeEditorScreen())
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.blue]
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0,2),
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Click to Edit",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontFamily: 'Overpass'
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                            color: Colors.black,
                            iconSize: 45,
                          onPressed: () {
                            setState(() {
                              Containers.removeAt(index);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

