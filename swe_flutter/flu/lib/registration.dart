import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _auth=FirebaseAuth.instance;
  User loggedInUser;
  void initState(){
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() async{
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser=user;
      }
    }
    catch(e){
      print(e);
    }
  }

  @override
  String email='';
  String password='';
  String username='';
  String phonenumber='';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text("REGISTER HERE ")),
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
      Column(
        children: [

          Expanded(

            child: Container(),),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(child: Container()),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        // controller: cname,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          icon: Icon(Icons.person,
                            color: Colors.white,

                          ),

                          hintText: 'What do people call you?',
                          hintStyle: TextStyle( color: Colors.white),
                          labelText: 'Name *',
                          labelStyle: TextStyle( color: Colors.white),
                        ),
                        onSaved: (String value) {
                          username=value;
                        },
                        onChanged: (String value) {
                          username=value;
                        },
                        // validator: _validateName,
                      ),
                      const SizedBox(height: 24.0),
                      TextFormField(
                        // controller: caddress,
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          icon: Icon(Icons.email,
                            color: Colors.white,),
                          hintText: 'Enter your Email?',
                          hintStyle: TextStyle( color: Colors.white),
                          labelText: 'emai Address *',
                          labelStyle: TextStyle( color: Colors.white),
                        ),
                        onSaved: (String value) {
                          email=value;
                        },
                        onChanged: (String value){
                          email=value;
                        },
                        // validator: _validateName,
                      ),
                      const SizedBox(height: 24.0),
                      // "Phone number" form.
                      TextFormField(
                        // controller: cphoneNumber,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          icon: Icon(Icons.phone,
                            color: Colors.white,),
                          hintText: 'Where can we reach you?',
                          hintStyle: TextStyle( color: Colors.white),
                          labelText: 'Phone Number *',
                          labelStyle: TextStyle( color: Colors.white),
                          prefixText: '+91',
                        ),
                        keyboardType: TextInputType.phone,
                        onSaved: (String value) {
                          phonenumber=value;
                        },
                        onChanged: (String value) {
                          phonenumber=value;
                        },
                        // TextInputFormatters are applied in sequence.
                      ),
                      const SizedBox(height: 24.0),
                      // "Phone number" form.
                      TextFormField(
                        // controller: cphoneNumber,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          icon: Icon(Icons.security,
                            color: Colors.white,),
                          hintText: 'Where can we reach you?',
                          hintStyle: TextStyle( color: Colors.white),
                          labelText: 'Password *',
                          labelStyle: TextStyle( color: Colors.white),
                        ),
                        keyboardType: TextInputType.phone,
                        onSaved: (String value) {
                          password=value;
                        },
                        onChanged: (String value) {
                          password=value;
                        },
                        // TextInputFormatters are applied in sequence.
                      ),

                      const SizedBox(height: 24.0),
                      RaisedButton(
                        onPressed: () async {
                          try {
                            final newUser=await _auth.createUserWithEmailAndPassword(email: email, password: password);

                            CollectionReference users =FirebaseFirestore.instance.collection('users');
                            User user=FirebaseAuth.instance.currentUser;
                            DocumentSnapshot documentSnapshot= await users.doc(user.uid).get();

                            if(!documentSnapshot.exists){
                              users.doc(user.uid).set({
                                "id": user.uid,
                                "name": username,
                                "email": email,
                                "phonenumber": phonenumber,
                                "isdev": false,
                                "isdoct": false,
                              });
                            }
                            if(newUser!=null){
                              Navigator.pushNamed(context, '/');
                            }
                          }
                          catch(e){

                          }
                        },
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
          Expanded(
            child: Container(),),
        ],

      ),
    ],
          ),
    );

  }
}
