import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_test_app/drscreen.dart';
import 'package:demo_test_app/testing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Testpage extends StatefulWidget {
  @override
  _TestpageState createState() => _TestpageState();
}

class _TestpageState extends State<Testpage> {

  check()async{
    CollectionReference users =FirebaseFirestore.instance.collection('users');
    User user= FirebaseAuth.instance.currentUser;
    DocumentSnapshot documentSnapshot=await users.doc(user.uid).get();
    setState(() {
      if(documentSnapshot.data()['isdoct']==true){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>DrScreen()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'WAITINGGGG...',
          style: TextStyle(
            fontWeight:FontWeight.w900,
            backgroundColor: Colors.black,
            color: Colors.white,
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
                    Color(0xFF6E14FF),
                    Color(0xFF5F5F5F)
                  ])
          ),
        ),

        Center(

          child: Container(
            padding: EdgeInsets.all(50.0),
            margin: EdgeInsets.all(50.0),
            width: 1000,
            decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(20.0),
            ),
            child: Expanded(

              child: Center(
                child: Column(

                  children: [



                    RaisedButton(

                      child: Text(
                          'Refresh'
                      ),

                      onPressed: (){
                        check();
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Expanded(

                      child: Text(
                        'IF YOU ARE UNABLE TO LOGIN KINDLY CONTACT DEVELOPER',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight:FontWeight.w900,
                          backgroundColor: Colors.black,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    Expanded(
                      child: Text(
                        'DEVELOPER CONTACT: Tminus0@gmail.com',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight:FontWeight.w900,
                          backgroundColor: Colors.black,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
    ),
    ),
        ),
    ],
    ),
    );
  }
}
