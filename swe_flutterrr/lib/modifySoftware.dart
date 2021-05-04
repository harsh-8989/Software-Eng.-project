import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ONE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'MODIFICATION',
            style: TextStyle(
              fontWeight:FontWeight.w900,
              backgroundColor: Colors.black,
              color: Colors.white,
            ),


          ),
        ),
      ),
      body: Stack(

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
          

          Row(
            children: [
              Expanded(
                child: Container(
                  child: null,
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(

                    child: RichText(
                        text: TextSpan(

                            text: "CLICKKK HEREE",


                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:35.0,
                                  fontStyle: FontStyle.italic,
                                  decoration: TextDecoration.underline
                              ),


                            recognizer: TapGestureRecognizer()..onTap =  () async{
                              var url = "https://github.com/harsh-8989/Software-Eng.-project";
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            }
                        )
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
