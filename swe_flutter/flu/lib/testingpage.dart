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
        title: Text('successfill'),
      ),
      body: Container(
        child: RaisedButton(
          child: Text('Refresh'),

          onPressed: (){
            check();
          },
        ),
      ),
    );
  }
}