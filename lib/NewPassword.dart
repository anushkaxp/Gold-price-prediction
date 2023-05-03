import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold_n/FAQ.dart';
import 'package:gold_n/GoldStocks.dart';
import 'package:gold_n/Home.dart';
import 'package:gold_n/NewPassword.dart';
import 'package:gold_n/Settings.dart';


class NewPassword extends StatefulWidget {
  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  String warning = "";

  String changePassword = "";

  String change_warning = "";

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
          top: 130,
          left: 39,
          child: Text('Create New Password', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
          decoration: TextDecoration.none,
          fontFamily: 'IBM Plex Sans Thai Looped',
          fontSize: 24,
          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
          fontWeight: FontWeight.normal,
          height: 1
      ),)
    ),
            Positioned(
    top: 160,
    left: 39,
    child: Container(
      width: 350,
        height: 100,
        child: Text('Your new password must be different from previous used passwords.', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            decoration: TextDecoration.none,
            fontFamily: 'IBM Plex Sans Thai Looped',
            fontSize: 15,
            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1.5
        ),)
    ),

    ),Positioned(
    top: 225,
    left: 39,
    child: Text('New Password', textAlign: TextAlign.left, style: TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
        decoration: TextDecoration.none,
    fontFamily: 'IBM Plex Sans Thai Looped',
    fontSize: 14,
    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    fontWeight: FontWeight.normal,
    height: 1
    ),)
    ),

            Positioned(
                top: 355,
                left: 39,
                child: Text('Re-Write Password', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    decoration: TextDecoration.none,
                    fontFamily: 'IBM Plex Sans Thai Looped',
                    fontSize: 14,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),)
            ),


            Positioned(
    top: 260,
    left: 39,
      child:SizedBox(
        width: 350,
        height: 50,
        child : TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black, width: 20),
            ),
            hintText: ' ',
            contentPadding: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
            filled: true,
            fillColor: const Color.fromRGBO(48, 52, 99, 1),
          ),
          style: TextStyle(
            color: Colors.white, // set the color of the text
          ),
            onChanged: (text) {
            if (text.length < 8) {
              warning = '* Input must be at least 8 characters long.';
            }
            else {
              warning = ' ';
            }
            changePassword = text;
            },
    ),
   )
    ),

            Positioned(
                top: 390,
                left: 39,
                child:SizedBox(
                  width: 350,
                  height: 50,
                  child : TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black, width: 20),
                      ),
                      hintText: ' ',
                      contentPadding: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
                      filled: true,
                      fillColor: const Color.fromRGBO(48, 52, 99, 1),
                    ),
                    style: TextStyle(
                      color: Colors.white, // set the color of the text
                    ),
                    onChanged: (text) {
                      if (text != changePassword) {
                        change_warning = '* Both passwords must match.';
                      }
                      else {
                        change_warning = ' ';
                      }
                    },
                  ),
                )
            ),

            Positioned(
                top: 325,
                left: 39,
                child: Text(warning, textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    decoration: TextDecoration.none,
                    fontFamily: 'IBM Plex Sans Thai Looped',
                    fontSize: 10,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),)
            ),

            Positioned(
                top: 450,
                left: 39,
                child: Text(change_warning, textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    decoration: TextDecoration.none,
                    fontFamily: 'IBM Plex Sans Thai Looped',
                    fontSize: 10,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),)
            ),

            Positioned(
    top: 480,
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
                child: Text('Reset Password ', textAlign: TextAlign.center, style: TextStyle(
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
            MaterialPageRoute(builder: (context) =>Settings()),
          );
        },

      ),
    ),

    ]
    )),)
    );
  }
}
        