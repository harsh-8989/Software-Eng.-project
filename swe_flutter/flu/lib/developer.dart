import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Devop extends StatefulWidget {
  @override
  _DevopState createState() => _DevopState();
}


CollectionReference userRef=FirebaseFirestore.instance.collection("users");

class _DevopState extends State<Devop> {

  changestatus(String id,bool k){
    setState(() async{
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      await users.doc(id).update({
        'isdoct':k?false:true,
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I AM A DEVELOPER'),
      ),
      body:Container(
        child: StreamBuilder(
            stream: userRef.snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              return ListView(
                children: snapshot.data.docs.map(
                      (document) {
                    return
                      //   CustomUserTile(
                      //   document.id,
                      //   title: document["name"] + "(" + document.id + ")",
                      //   description: document["description"],
                      //   isEnroled: enroled.contains(document.id),
                      // )
                      Container(
                        child: Column(
                          children: [
                            Text(
                                document["name"],
                            style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 32.0,

                            ),
                            ),
                            Text(
                              document["email"],
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 32.0,

                              ),
                            ),Text(
                              document["phonenumber"],
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 32.0,

                              ),
                            ),

                            RaisedButton(
                              child: Text(document["isdoct"].toString()),
                              onPressed: (){
                                changestatus(document["id"],document["isdoct"]);
                              },
                            ),
                            SizedBox(
                              height:25,
                            ),

                          ],
                        ),
                      );
                  },
                ).toList(),
              );
            }),
      ),
    );
  }
}