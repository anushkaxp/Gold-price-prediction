import 'package:flutter/material.dart';
import 'package:gold_n/MyLogin.dart';
import 'package:gold_n/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyRegister extends StatefulWidget {
  @override
  State<MyRegister> createState() => _MyRegisterState();
}
final FirebaseAuth _auth = FirebaseAuth.instance;
final TextEditingController _FirstNameController = TextEditingController();
final TextEditingController _LastNameController = TextEditingController();
final TextEditingController _EmailController = TextEditingController();
final TextEditingController _NumberController = TextEditingController();
final TextEditingController _PasswordController = TextEditingController();
final TextEditingController _ConformPasswordController = TextEditingController();

String firstName = _FirstNameController.text;
String lastName = _LastNameController.text;
String email = _EmailController.text;
String number = _NumberController.text;
String password = _PasswordController.text;
String conformPassword = _ConformPasswordController.text;

class _MyRegisterState extends State<MyRegister> {


  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator SignupWidget - FRAME
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
                  top: 70,
                  left: 38,
                  child: Text('First name ', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'IM FELL Great Primer SC',
                      decoration: TextDecoration.none,
                      fontSize: 24,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),



            Positioned(
            top: 105,
            left: 35,
              child:SizedBox(
                width: 350,

                child : TextField(
                  controller: _FirstNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'First Name',
                    hintStyle: TextStyle(
                      color: Colors.black45,

                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                  ),

                ),),
        ),
              Positioned(
                  top: 180,
                  left: 38,
                  child: Text('Last name', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      decoration: TextDecoration.none,
                      fontFamily: 'IM FELL Great Primer SC',
                      fontSize: 24,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),
              Positioned(
                top: 215,
                left: 35,
                child:SizedBox(
                  width: 350,
                  child : TextField(
                    controller: _LastNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Last Name',
                      hintStyle: TextStyle(
                        color: Colors.black45,

                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    ),

                  ),),
              ),

              Positioned(
                  top: 288,
                  left: 43,
                  child: Text('Email', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      decoration: TextDecoration.none,
                      fontFamily: 'IM FELL Great Primer SC',
                      fontSize: 25,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),
              Positioned(
                top: 325,
                left: 35,
                child:SizedBox(

                  width: 350,
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
                  top: 400,
                  left: 47,
                  child: Text('Phone no', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      decoration: TextDecoration.none,
                      fontFamily: 'IM FELL Great Primer SC',
                      fontSize: 25,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),
              Positioned(
        top: 438,
        left: 35,
                child:SizedBox(
                  width: 350,
                  child : TextField(
                    controller: _NumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Phone No',
                      hintStyle: TextStyle(
                        color: Colors.black45,

                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    ),

                  ),),
                  ),

              Positioned(
                  top: 515,
                  left: 43,
                  child: Text('Create Password', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      decoration: TextDecoration.none,
                      fontFamily: 'IM FELL Great Primer SC',
                      fontSize: 25,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),
              Positioned(
                top: 554,
                left: 44,
                child:SizedBox(
                  width: 330,
                  child : TextField(
                    controller: _PasswordController,
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
                  top: 630,
                  left: 43,
                  child: Text('Confirm Password',

                    textAlign: TextAlign.left, style: TextStyle(

                      color: Color.fromRGBO(255, 255, 255, 1),
                      decoration: TextDecoration.none,
                      fontFamily: 'IM FELL Great Primer SC',
                      fontSize: 25,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),
              Positioned(
                top: 670,
                left: 44,
                child:SizedBox(
                  width: 330,

                  child : TextField(
                    controller: _ConformPasswordController,
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
    top: 750,
    left: 150,
    child: Container(
    width: 120,
    height: 54,
    decoration: BoxDecoration(
    borderRadius : BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
    ),
    color : Color.fromRGBO(255, 211, 99, 1),
    )
    )
    ),

              Positioned(
    top: 765,
    left: 165,
    child: GestureDetector(
    child: Text('Sign Up', textAlign: TextAlign.left, style: TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'Inter',
    fontSize: 25,
    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    fontWeight: FontWeight.normal,
    height: 1
    ),),
        onTap: () {
          print("Text is ${_ConformPasswordController.text}");
          print("pas is ${_PasswordController.text}");


          if(_ConformPasswordController.text!="" && _ConformPasswordController.text==_PasswordController.text){
            print("hello");
            FirebaseAuth.instance.createUserWithEmailAndPassword(email: _EmailController.text, password: _PasswordController.text).then((value){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
            }).onError((error, stackTrace) {
              print("Error ${error.toString()}");
            });

          }

          else{
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('please check credentials'),
              ),
            );
          }
    }
    ),
              ),



              Positioned(
                top: 813,
                left: 270,

                child: GestureDetector(
                  child: Text('Sign In',
                    textAlign: TextAlign.left, style: TextStyle(

                        color: Color.fromRGBO(255, 255, 255, 1),
                        decoration: TextDecoration.none,
                        fontFamily: 'IM FELL Great Primer SC',
                        fontSize: 25,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                  onTap: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => MyLogin()),
                    );
                  },
                ),
              ),
              Positioned(
                  top: 820,
                  left: 115,
                  child: Text('Already have account?',
                      textAlign: TextAlign.left, style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'Inter',
                        fontSize: 15,
                        color: Color.fromRGBO(255, 255, 255, 1),
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1


                    ),)
              ),

              Positioned(
                  top: 845,
                  left: 200,
                  child: Text('Or',

                    textAlign: TextAlign.left, style: TextStyle(

                        color: Color.fromRGBO(255, 255, 255, 1),
                        decoration: TextDecoration.none,
                        fontFamily: 'IM FELL Great Primer SC',
                        fontSize: 20,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,

                    ),)
              ),


              Positioned(
                  top: 875,
                  left: 140,
                  child: Container(
                    height: 50,
                    width: 50,
                        decoration: BoxDecoration(
                        image : DecorationImage(
                            image: AssetImage('assets/images/Google.png'),

                        ),
                      )
                  )
              ),

              Positioned(
                  top: 875,
                  left: 240,
                  child: Container(
                      height:50,
                      width: 50,
                      decoration: BoxDecoration(
                        image : DecorationImage(
                            image: AssetImage('assets/images/Facebook.png'),

                        ),
                      )
                  )
              ),

    ]
    )
    ),),
    );
  }
}
