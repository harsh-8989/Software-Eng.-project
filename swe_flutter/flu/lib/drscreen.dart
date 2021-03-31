import 'package:flutter/material.dart';


class DrScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child:
          Center(
            child: Text(
                "WELCOME",
                style: TextStyle(
                  color: Colors.black,
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
                  image: AssetImage('images/hi.jpg'),
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        FlatButton(

                          onPressed: () {

                          },
                          hoverColor: Colors.blueGrey,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('VISUALIZE MODEL', style: TextStyle(
                              color: Colors.black,
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

                          onPressed: () {

                          },
                          hoverColor: Colors.blueGrey,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('MODIFY SOFTWARE', style: TextStyle(
                              color: Colors.black,
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

                          onPressed: () {

                          },
                          hoverColor: Colors.blueGrey,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('CONTACT DEVELOPER', style: TextStyle(
                              color: Colors.black,
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
    );
  }
}
