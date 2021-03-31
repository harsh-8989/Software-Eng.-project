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
        backgroundColor: Colors.black,
        title: Center(
          child: Text('I AM A DEVELOPER',
          style: TextStyle(
            color: Colors.white
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
                      Color(0xFF6E14FF),
                      Color(0xFF5F5F5F)
                    ])
            ),
          ),
          Container(
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

                            child: Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white30,
                              ),

                              child: Column(
                                children: [

                                  Text(
                                    document["name"],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 25.0,

                                    ),
                                  ),
                                  Text(
                                    document["email"],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,

                                    ),
                                  ),Text(
                                    document["phonenumber"],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,

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
                            ),
                          );
                      },
                    ).toList(),
                  );
                }),
          ),
        ],
      )

    );
  }
}
