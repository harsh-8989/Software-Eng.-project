import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: SizedBox(
          height: 30,
          child: Image.asset('images/logo.png'),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bg1.PNG'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          width:5,
                          height: 5,
                          child:Image.asset('images/logo.png', fit: BoxFit.cover),
                        ),
                        Text('Welcome to',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 80.0,


                          ),
                        ),
                        Text('Tminus0',
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 32.0,

                              decoration: TextDecoration.underline
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 500,
                        ),
                        FlatButton(
                          onPressed:(){
                            Navigator.pushNamed(context, '/login_page');
                          },
                          hoverColor: Colors.white60,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('ENTER', style: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              // backgroundColor: Colors.black,
                            )
                            ),
                          ),
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(side: BorderSide(
                            color: Colors.white70,
                            width: 5,
                            style: BorderStyle.solid,
                          ), borderRadius: BorderRadius.circular(50)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}