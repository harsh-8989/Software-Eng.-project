import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Removedr extends StatefulWidget {
  @override
  _RemovedrState createState() => _RemovedrState();
}


CollectionReference userRef=FirebaseFirestore.instance.collection("users");

class _RemovedrState extends State<Removedr> {

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
            child: Text('REMOVE DR',
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
                        Color(0xFF6E15FF),
                        Color(0xFF720094)
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
                            if (document["isdoct"]) {
                              return
                                //   CustomUserTile(
                                //   document.id,
                                //   title: document["name"] + "(" + document.id + ")",
                                //   description: document["description"],
                                //   isEnroled: enroled.contains(document.id),
                                // )
                                Container(

                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(25),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.purple.shade50,
                                    ),

                                    child: Column(

                                      children: [


                                        Row(

                                          children: [
                                            Text(
                                                'NAME:'
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              document["name"],
                                              style: TextStyle(
                                                color: Colors.pink[900],
                                                fontWeight: FontWeight.w900,
                                                fontSize: 25.0,

                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),

                                        Row(

                                          children: [
                                            Text(
                                                'EMAIL:'
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              document["email"],
                                              style: TextStyle(
                                                color: Colors.pink[900],
                                                fontWeight: FontWeight.w900,
                                                fontSize: 25.0,

                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(

                                          children: [
                                            Text(
                                                'PHONE_NUMBER:'
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              document["phonenumber"],
                                              style: TextStyle(
                                                color: Colors.pink[900],
                                                fontWeight: FontWeight.w900,
                                                fontSize: 25.0,

                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(

                                          children: [
                                            Text(
                                                'YOE:'
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              document["yoe"],
                                              style: TextStyle(
                                                color: Colors.pink[900],
                                                fontWeight: FontWeight.w900,
                                                fontSize: 25.0,

                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(

                                          children: [
                                            Text(
                                                'SPECIFICATION:'
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              document["position"],
                                              style: TextStyle(
                                                color: Colors.pink[900],
                                                fontWeight: FontWeight.w900,
                                                fontSize: 25.0,

                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ButtonTheme(
                                          minWidth: 200.0,
                                          height: 50.0,
                                          child: RaisedButton(

                                            color: Colors.purple.shade200,
                                            child: Text('REMOVE'),
                                            onPressed: () {
                                              changestatus(document["id"],
                                                  document["isdoct"]);
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),

                                      ],
                                    ),
                                  ),
                                );
                            }
                            else{
                              return Container();
                            }
                          }


                      ).toList(),
                    );
                  }),
            ),
          ],
        )

    );
  }
}