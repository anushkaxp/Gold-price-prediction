import 'package:flutter/material.dart';
import 'package:gold_n/Home.dart';
import 'package:gold_n/MyRegister.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;


final TextEditingController _EmailController = TextEditingController();
final TextEditingController _PasswordController = TextEditingController();

String email = _EmailController.text;
String password = _PasswordController.text;

class MyLogin extends StatefulWidget {
  @override
  State<MyLogin> createState() => _MyLoginState();
}



class _MyLoginState extends State<MyLogin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool? isChecked = false;


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Material(
      child: Container(
      width: 360,
      height: 801,
      decoration: BoxDecoration(
        color : Color.fromRGBO(48, 52, 99, 1),
      ),
      child: Stack(
          children: <Widget>[

            Positioned(
                top: 80,
                left: 30,
                child: Container(
                    width: 350,
                    height: 200,
                    decoration: BoxDecoration(
                      image : DecorationImage(
                          image: AssetImage('assets/images/App logo.png'),

                      ),
                    )
                )
            ),

          Positioned(
          top: 310,
          left: 23,
          child: Text('Hey,WelcomeBack!!', textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
          fontFamily: 'IM FELL Great Primer SC',
          fontSize: 35,
              decoration: TextDecoration.none,
          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
          fontWeight: FontWeight.normal,
          height: 1
      ),)
    ),
            Positioned(
                top: 378,
                left: 49,
                child: Text('Email', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'IM FELL Great Primer SC',
                    decoration: TextDecoration.none,
                    fontSize: 25,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),)
            ),

            Positioned(
    top: 426,
    left: 44,
    child:SizedBox(
    width: 320,
    child : TextField(
      controller: _EmailController,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide.none,
      ),
    hintText: 'Email',
    hintStyle: TextStyle(
    color: Colors.black45,
    ),
      filled: true,
      fillColor: const Color.fromRGBO(255, 255, 255, 1),
    ),

    ),),
    ),

            Positioned(
                top: 502,
                left: 49,
                child: Text('Password', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'IM FELL Great Primer SC',
                    decoration: TextDecoration.none,
                    fontSize: 25,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),)
            ),
            Positioned(
              top: 546,
              left: 44,
              child:SizedBox(
                width: 320,
                child : TextField(
                  controller: _PasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.black45,
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                ),
              ),

            Positioned(
    top: 626,
    left: 220,
    child: Text('Forgotpassword?', textAlign: TextAlign.left, style: TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
    fontFamily: 'Inter',
    fontSize: 16,
    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    fontWeight: FontWeight.normal,
    height: 1
    ),)
    ),

            Positioned(
    top: 670,
    left: 160,
    child: Container(
      padding: EdgeInsets. symmetric(horizontal: 50.0, vertical: 25.0),

        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: Colors.amber,
        )

    )
    ),

            Positioned(
    top: 685,
    left: 180,
    child: GestureDetector(
    child: Text('Login', textAlign: TextAlign.left, style: TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'Inter',
        decoration: TextDecoration.none,
    fontSize: 25,
    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    fontWeight: FontWeight.normal,
    height: 1
    ),
    ),
        onTap: () {
            showDialog(context: context, builder: (context)=>Center(child: CircularProgressIndicator(),));
            FirebaseAuth.instance.signInWithEmailAndPassword(email: _EmailController.text, password: _PasswordController.text).then((value) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
            }).onError((error, stackTrace) {

              print("Error is ${error.toString()}");
              Navigator.pop(context);
            });

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Home()),
          //   );
            },
    ),
            ),

            Positioned(
    top: 759,
    left: 120,
    child: GestureDetector(

    child: Text('New user?', textAlign: TextAlign.left, style: TextStyle(
    // color: undefined,
      decoration: TextDecoration.none,
    fontFamily: 'Inter',
    fontSize: 20,
        color: Color.fromRGBO(255, 255, 255, 1),
    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    fontWeight: FontWeight.normal,
    height: 1
    ),
    ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyRegister()),
        );
      },
    ),),
            Positioned(
              top: 759,
              left: 220,
              child: GestureDetector(

                child: Text('Sign Up', textAlign: TextAlign.left, style: TextStyle(
                  // color: undefined,
                    decoration: TextDecoration.none,
                    fontFamily: 'Inter',
                    fontSize: 20,
                    color: Color.fromRGBO(228, 183, 255, 1),
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyRegister()),
                  );
                },
              ),),

    ]
    ),),)
    );
  }
}
