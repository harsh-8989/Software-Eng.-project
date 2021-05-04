import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drscreen.dart';
class CONTACT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'CONTACT DEVELOPER',
              style: TextStyle(
                fontWeight:FontWeight.w900,
                backgroundColor: Colors.black,
                color: Colors.white,
              ),


            ),
          ),
        ),
      body:Stack(
          children: [
          Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFF6E15FF),
                Color(0xFF720094)
              ])
               ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(75),
              // color: Colors.white,
              height: 1000,
              width: 1000,
              decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center ,
                children: [
                   CircleAvatar(radius: (75),
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius:BorderRadius.circular(50),
                        child: Image.asset("images/msg.png"),
                      )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'FOR ANY QUERY CONTACT DEVELOPER ',
                  style: TextStyle(
                  color: Colors.black,
                    fontWeight:FontWeight.w900,
                    fontSize: 50.0,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline),

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'tminus0@gmail.com',
                    style: TextStyle(
                    color: Colors.black,
                    fontWeight:FontWeight.w500,
                    fontSize: 50.0,

                    decoration: TextDecoration.underline),

                ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '+91-7029957741',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight:FontWeight.w500,
                        fontSize: 50.0,
                        decoration: TextDecoration.underline),

                  )
                ],
              ),

          )
    )
      ]

    )
    );
  }
}
