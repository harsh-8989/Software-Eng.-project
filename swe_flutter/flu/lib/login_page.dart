import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_test_app/adminScreen.dart';
import 'package:demo_test_app/developer.dart';
import 'package:demo_test_app/registration.dart';
import 'package:demo_test_app/testingpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth=FirebaseAuth.instance;
  String email;
  String password;
  checkdev()async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    User user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot documentSnapshot = await users.doc(user.uid).get();
    setState(() {
      if (documentSnapshot.data()['isdev'] == true) {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>AdminScreen()));
      }
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
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
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    padding: EdgeInsets.all(50.0),
                    margin: EdgeInsets.all(50.0),
                    // color: Colors.white,
                    decoration: BoxDecoration(
                        color: Colors.purple.shade50,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 75.0,
                          backgroundColor: Colors.red,
                          backgroundImage: AssetImage('images/doc icon.png'),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Doctor',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32.0,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          // textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            icon: Icon(Icons.person),
                            hintText: 'Enter Your mail ID',
                            labelText: 'User ID *',
                          ),
                          onChanged: (String value){
                            email=value;
                          },
                          onSaved: (String value){
                            email=value;
                          },
                        ),
                        SizedBox(
                          height:25,
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.security),

                          ),
                          onChanged: (String value){
                            password=value;
                          },

                        ),
                        SizedBox(
                          height:25,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container()),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: ElevatedButton(
                                    onPressed: () async{
                                      try {
                                        final user = await _auth
                                            .signInWithEmailAndPassword(
                                            email: email, password: password);
                                        if (user != null) {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Testpage()));
                                        }
                                      }
                                      catch(e){
                                        print(e);
                                      }
                                    },
                                    child: const Text('Submit'),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'or',

                            ),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Navigator.pop(context);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>Register()));
                                  },
                                  child: const Text(
                                    'New Register',
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                width: 1,
                height: 600,
                color: Colors.white,
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Container(
                    padding: EdgeInsets.all(50.0),
                    margin: EdgeInsets.all(50.0),
                    // color: Colors.white,
                    decoration: BoxDecoration(
                        color: Colors.purple.shade50,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 75.0,
                          backgroundColor: Colors.red,
                          backgroundImage: AssetImage('images/dev icon.png'),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Admin',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32.0,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            icon: Icon(Icons.person),
                            hintText: 'Enter Your Username',
                            labelText: 'Username *',

                          ),
                          onChanged: (String value){
                            email=value;
                          },
                          onSaved: (String value){
                            email=value;
                          },

                        ),
                        SizedBox(
                          height:25,
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.security),

                          ),
                          onChanged: (String value){
                            password=value;
                          },
                        ),
                        SizedBox(
                          height:25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            onPressed: () async{
                              try {
                                final user = await _auth
                                    .signInWithEmailAndPassword(
                                    email: email, password: password);
                                if (user != null) {
                                  checkdev();
                                }
                              }
                              catch(e){
                                print(e);
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
