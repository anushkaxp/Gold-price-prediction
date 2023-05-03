import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold_n/FAQ.dart';
import 'package:gold_n/Home.dart';
import 'package:gold_n/NewPassword.dart';
import 'package:gold_n/Settings.dart';
import 'package:gold_n/GoldStocks.dart';
import 'package:gold_n/Settings.dart';
import 'package:gold_n/ResetPassword.dart';

class ResetPassword extends StatefulWidget {
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Material(
        child:Container(
      width: 360,
      height: 800,
      decoration: BoxDecoration(
        color : Color.fromRGBO(48, 52, 99, 1),
      ),
      child: Stack(
          children: <Widget>[
            Positioned(
              top: 70,
              left: 15,
              child:GestureDetector(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 40.0,
                ),
                onTap: () {
                  Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
            ),
            Positioned(
              top: 70,
              left: 360,
              child: GestureDetector(
                  child:Icon(Icons.question_answer_rounded, size: 40,),
                  onTap: () {
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => FAQ()),
                    );

                  }
              ),),

          Positioned(
          top: 123,
          left: 45,
          child: Text('Reset password', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
          decoration: TextDecoration.none,
          fontFamily: 'IBM Plex Sans Thai Looped',
          fontSize: 24,
          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
          fontWeight: FontWeight.normal,
          height: 1.5
      ),)
    ),


            Positioned(
    top: 180,
    left: 54,
    child: Container(
      width: 350,
        height: 100,
        child: Text('Enter the mail associated with your account and well send an email with instructions to reset your password.', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            decoration: TextDecoration.none,
            fontFamily: 'IBM Plex Sans Thai Looped',
            fontSize: 15,
            letterSpacing: 1 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1
        ),)
    ),

    ),Positioned(
    top: 255,
    left: 39,
    child: Text('Email address', textAlign: TextAlign.left, style: TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
        decoration: TextDecoration.none,
    fontFamily: 'IBM Plex Sans Thai Looped',
    fontSize: 12,
    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    fontWeight: FontWeight.normal,
    height: 1
    ),)
    ),

            Positioned(
    top: 290,
    left: 40,
      child:SizedBox(
        width: 350,
        height: 50,
        child : TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black, width: 20),
            ),
            hintText: '123abc@gmail.com',
            hintStyle: TextStyle(
              color: Colors.white54,
            ),
            contentPadding: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
            filled: true,
            fillColor: const Color.fromRGBO(48, 52, 99, 1),
          ),
          style: TextStyle(
            color: Colors.white, // set the color of the text
          ),
        ),
   )
    ),
            Positioned(
    top: 370,
    left: 65,
    child:GestureDetector(
        child: Container(
            width: 300,
            height: 50,
            decoration: BoxDecoration(
              borderRadius : BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow : [BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(0,4),
                  blurRadius: 4
              )],
              color : Color.fromRGBO(24, 52, 150, 1),
              border : Border.all(
                color: Color.fromRGBO(0, 0, 0, 1),
                width: 2,
              ),
            ),
            child: Padding(
                padding: EdgeInsets.only(left: 0, top: 15.0),
                child: Text('send Instruction', textAlign: TextAlign.center, style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    decoration: TextDecoration.none,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),)
            )
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewPassword()),
          );
        },

      ),
    ),
            Positioned(
    top: 445,
    left: 40,
    child: Container(
      width: 350,
    height: 50,
    child: Text('Didnt get the email? check your spam filter, \nor ', textAlign: TextAlign.center, style: TextStyle(
    color: Colors.white,
        decoration: TextDecoration.none,
    fontFamily: 'IBM Plex Sans Thai Looped',
    fontSize: 14,
    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    fontWeight: FontWeight.normal,
    height: 1.5
    ),),),
    ),
          Positioned(
            top: 488,
            left: 40,
          child: Container(
            width: 350,
            height: 50,
            child: Text('Try another email address', textAlign: TextAlign.center, style: TextStyle(
                color: Color.fromRGBO(228, 183, 255, 1),
                decoration: TextDecoration.none,
                fontFamily: 'IBM Plex Sans Thai Looped',
                fontSize: 14,
                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.5
            ),),),
        ),
    ]
    )),)
    );
  }
}
        