import 'package:demo_test_app/developer.dart';
import 'package:flutter/material.dart';



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
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>Devop()));
                            },
                            hoverColor: Colors.blueGrey,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text('ADD/UPDATE DOCTOR', style: TextStyle(
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
