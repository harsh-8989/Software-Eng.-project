import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

Widget passmatch=Container();
// @override
String email='';
String password='';
String username='';
String phonenumber='';
String yoe='';
String position='';

class _RegisterState extends State<Register> {
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
  GlobalKey<FormFieldState<String>>();

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

  macthpass(String s){
    print(s);
    print(password);
    if(s!=password){
      setState(() {
        passmatch=Container(
          child: Text('Your Password Doesn\'t Match',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        );
      });
    }
    else{
      setState(() {
        passmatch=Container(
          child: Text('Password Matched',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        );
      });
    }
    return true;
  }

  String _validaterePass(String value) {
    if (rePass.text != password){
      setState(() {
        passmatch=Container(
          child: Text('Your Password Doesn\'t Match',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        );
      });
      return 'not matched';
    }
    else{
      setState(() {
        passmatch=Container(
          child: Text('Password Matched',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        );
      });
    }
    return 'matched';
  }



  TextEditingController rePass = TextEditingController();

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child:
          Text(
              "REGISTER HERE ",
              style: TextStyle(
                color: Colors.pink.shade50,
                fontWeight: FontWeight.w900,
              )
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

          Container(
            padding: EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 200.0,right: 200.0),
            // color: Colors.white,
            decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                // CircleAvatar(radius: (50),
                //     backgroundColor: Colors.white,
                //     child: ClipRRect(
                //       borderRadius:BorderRadius.circular(50),
                //       child: Image.asset("images/register.png"),
                //     )
                // ),
                // SizedBox(
                //   height: 25,
                // ),

                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  // controller: cname,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(Icons.person,
                      color: Colors.purple,

                    ),

                    hintText: 'What do people call you?',
                    hintStyle: TextStyle( color: Colors.black),
                    labelText: 'Name *',
                    labelStyle: TextStyle( color: Colors.black),
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
                        color: Colors.purple),
                    hintText: 'Enter your Email?',
                    hintStyle: TextStyle( color: Colors.black),
                    labelText: 'email Address *',
                    labelStyle: TextStyle( color: Colors.black),
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
                      color: Colors.purple,),
                    hintText: 'Where can we reach you?',
                    hintStyle: TextStyle( color: Colors.black),
                    labelText: 'Phone Number *',
                    labelStyle: TextStyle( color: Colors.black),
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

                TextFormField(
                  // controller: cphoneNumber,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(Icons.calendar_today,
                      color: Colors.purple,),
                    hintText: 'Enter Years Of Experience!',
                    hintStyle: TextStyle( color: Colors.black),
                    labelText: 'YOE *',
                    labelStyle: TextStyle( color: Colors.black),

                  ),
                  keyboardType: TextInputType.number,

                  onSaved: (String value) {
                    yoe=value;
                  },
                  onChanged: (String value) {
                    yoe=value;
                  },
                  // TextInputFormatters are applied in sequence.
                ),

                const SizedBox(height: 24.0),

                TextFormField(
                  // controller: cphoneNumber,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(Icons.medical_services_sharp,
                      color: Colors.purple,),
                    hintText: 'Enter your specification?',
                    hintStyle: TextStyle( color: Colors.black),
                    labelText: 'Position *',
                    labelStyle: TextStyle( color: Colors.black),

                  ),


                  onSaved: (String value) {
                    position=value;
                  },
                  onChanged: (String value) {
                    position=value;
                  },
                  // TextInputFormatters are applied in sequence.
                ),

                const SizedBox(height: 24.0),


                // "Phone number" form.
                PasswordField(
                  fieldKey: _passwordFieldKey,

                  helperText: 'Not more than 8 characters.',
                  labelText: 'Password *',


                  onFieldSubmitted: (String value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                TextFormField(
                  // controller: rePass,
                  validator: _validaterePass,
                  onChanged: (String value) {
                    setState(() {
                      macthpass(value);
                    });

                  },

                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(Icons.security),
                    labelText: 'Re-type password *',
                  ),
                  maxLength: 8,
                  obscureText: true,
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
                          "yoe":yoe,
                          "position":position,
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
                passmatch
              ],
            ),
          ),
        ],
      ),
    );

  }
}
class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      onChanged: (String v){
        password=v;
      },
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}