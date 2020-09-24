import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:recipe_saver/Screens/saver_recipes.dart';
import 'package:recipe_saver/models/recipe_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'recipe_view.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {

  List<RecipeModel> recipes = new List<RecipeModel>();
  TextEditingController textEditingController = new TextEditingController();


  getRecipes(String query) async{
    String url = "https://api.edamam.com/search?q=$query&app_id=93406f3b&app_key=a1134233ef1fb5624e1f830c0a4a28bb";

    var response = await http.get(url);
    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData["hits"].forEach((element){

      RecipeModel recipeModel = new RecipeModel();
      recipeModel = RecipeModel.fromMap(element['recipe']);
      recipes.add(recipeModel);

    });

    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blueGrey,
                  Colors.blueGrey[900],
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: Platform.isIOS? 60: 30, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => saverecipes()));
                            }
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
                            },
                            child: Container(
                              child: Icon(Icons.refresh, size: 20,color: Colors.white),
                            ),
                          ),
                          Row(
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
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text(
                    "What will you cook today?",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    "Just enter ingredients you have and we will show the best recipe for you",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: textEditingController,
                            decoration: InputDecoration(
                              hintText: "Enter Ingredients",
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'Overpass'
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: "OverpassRegular"
                            ),
                          ),
                        ),
                        SizedBox(width: 16,),
                        InkWell(
                          onTap: () {
                            if(textEditingController.text.isNotEmpty){
                              getRecipes(textEditingController.text);
                              print("Please type in an ingredient");
                            }else{
                              print("Here is all the recipes with the keywords provided");
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              gradient: LinearGradient(colors: [const Color(0xffA2834D), const Color(0xffBC9A5F)])
                            ),
                            child: Icon(Icons.search, color: Colors.white, size: 25,),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    child: GridView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ClampingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200, mainAxisSpacing: 10.0
                      ),
                      children: List.generate(recipes.length, (index) {
                        return GridTile(
                          child: RecipeTile(
                        title: recipes[index].label,
                        source: recipes[index].source,
                        postUrl: recipes[index].url,
                        url: recipes[index].image,
                        ),
                      );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}


  class RecipeTile extends StatefulWidget {

    final String url, source, title, postUrl;
    RecipeTile({this.url, this.source, this.title, this.postUrl});

    @override
    _RecipeTileState createState() => _RecipeTileState();
  }

  class _RecipeTileState extends State<RecipeTile> {

    _launchURL(String url) async {
      print(url);
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    @override
    Widget build(BuildContext context) {
      return Wrap(
        children: [
          GestureDetector(
            onTap: () {
              if (kIsWeb) {
                _launchURL(widget.postUrl);
              } else {
                print(widget.postUrl + 'this is what we are going to see');
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => recipe_view(postUrl: widget.postUrl)));
              }
            },
            child: Container(
              child: Stack(
                children: [
                  Image.network(
                    widget.url,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: 200,
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white30, Colors.white],
                        begin: FractionalOffset.centerRight,
                        end: FractionalOffset.centerLeft,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                              fontFamily: 'OverpassRegular',
                            ),
                          ),
                          Text(
                            widget.source,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                              fontFamily: 'OverpassRegular',
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }
  }

