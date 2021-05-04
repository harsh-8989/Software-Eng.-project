import 'package:demo_test_app/adddr.dart';
import 'package:demo_test_app/developer.dart';
import 'package:demo_test_app/modifySoftware.dart';
import 'package:demo_test_app/removedr.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Center(
            child:
            Center(
              child: Text(
                  "WELCOME ",
                  style: TextStyle(
                    color: Colors.white30,
                    fontWeight: FontWeight.w900,

                  )
              ),
            ),

          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/jii.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),


              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(200.0),
                  child: Container(
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment:CrossAxisAlignment.stretch,
                        children: [

                          FlatButton(

                            onPressed:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>Removedr()));
                            },
                            hoverColor: Colors.blueGrey,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text('REMOVE DOCTOR', style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                // backgroundColor: Colors.black,
                              )
                              ),
                            ),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(side: BorderSide(
                              color: Colors.white70,
                              width: 5,
                              style: BorderStyle.solid,
                            ), borderRadius: BorderRadius.circular(50)),
                          ),
                          FlatButton(

                            onPressed:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>Adddr()));
                            },
                            hoverColor: Colors.blueGrey,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text('ADD DOCTOR', style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                // backgroundColor: Colors.black,
                              )
                              ),
                            ),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(side: BorderSide(
                              color: Colors.white70,
                              width: 5,
                              style: BorderStyle.solid,
                            ), borderRadius: BorderRadius.circular(50)),
                          ),
                          FlatButton(

                            onPressed:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>ONE()));
                            },
                            hoverColor: Colors.blueGrey,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text('MODIFY SOFTWARE', style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                // backgroundColor: Colors.black,
                              )
                              ),
                            ),
                            textColor: Colors.black,
                            shape: RoundedRectangleBorder(side: BorderSide(
                              color: Colors.white70,
                              width: 5,
                              style: BorderStyle.solid,
                            ), borderRadius: BorderRadius.circular(50)),
                          ),

                          FlatButton(


                            onPressed:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>ONE()));
                            },
                            hoverColor: Colors.blueGrey,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text('MODIFY MODEL', style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                // backgroundColor: Colors.black,
                              )
                              ),
                            ),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(side: BorderSide(
                              color: Colors.white70,
                              width: 5,
                              style: BorderStyle.solid,
                            ), borderRadius: BorderRadius.circular(50)),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}