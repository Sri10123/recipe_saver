import 'dart:io';
import 'package:flutter/material.dart';
import 'package:recipe_saver/Screens/saver_recipes.dart';

class RecipeEditorScreen extends StatefulWidget {
  @override
  _RecipeEditorScreenState createState() => _RecipeEditorScreenState();
}

class _RecipeEditorScreenState extends State<RecipeEditorScreen> {
  // ignore: non_constant_identifier_names
  List IngredientContainer = [];

  TextEditingController textFieldEdit = TextEditingController();

  TextEditingController IngredientSaver = TextEditingController();

  void initState() {
    super.initState();
    IngredientSaver.addListener(() {
      final text = IngredientSaver.text.toLowerCase();
      IngredientSaver.value = IngredientSaver.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blueGrey, Colors.blueGrey[900]])),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: Platform.isIOS ? 60 : 30, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => saverecipes()));
                  },
                  child: Text(
                    "Recipe",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => saverecipes()));
                  },
                  child: Text(
                    "Saver",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: Platform.isIOS ? 120 : 90, horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blueAccent],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15, left: 5),
                          child: Text(
                            "Dish:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 35,
                              fontFamily: 'Overpass',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                            EdgeInsets.only(top: 15, right: 5, left: 10),
                            child: TextField(
                              controller: textFieldEdit,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  hintText: "Enter Dish Title",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 25,
                                    color: Colors.grey,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.blueAccent),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.blueAccent),
                                  )),
                              style: TextStyle(
                                  fontFamily: 'Overpass',
                                  fontSize: 35,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "Ingredients:",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 25,
                                fontFamily: 'Overpass'),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add_circle_outline,
                              size: 30, color: Colors.black),
                          onPressed: () {
                            setState(() {
                              IngredientContainer.add('');
                            });
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: ListView.builder(
                          itemCount: IngredientContainer.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 50,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 7),
                                    child: Text(
                                      "Ingredient:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'OverPass',
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(left: 8, right: 8),
                                      child: TextField(
                                        controller: IngredientSaver,
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          hintText: 'Type Ingredient Here',
                                          hintStyle: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'Overpass',
                                            fontWeight: FontWeight.w200,
                                            color: Colors.grey,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blueAccent),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blueAccent),
                                          ),
                                        ),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Overpass',
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        IngredientContainer.removeAt(index);
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 7),
                                      child: Container(
                                        child: Icon(Icons.delete),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.blueGrey, Colors.blueGrey[900]]
                            ),
                          borderRadius: BorderRadius.circular(7)
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Enter",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Overpass',
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


