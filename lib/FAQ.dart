import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold_n/FAQ.dart';
import 'package:gold_n/Home.dart';
import 'package:gold_n/Profile.dart';
import 'package:gold_n/Settings.dart';




class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator NotificationWidget - FRAME
    return Container(
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
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),
            ),


            Positioned(
              top: 70,
              left: 360,
              child:GestureDetector(
                child: Icon(
                  Icons.menu_rounded,
                  size: 40.0,
                ),
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),
            ),



            Positioned(
              top: 130,
              left: 65,
              child:GestureDetector(
                child: Container(
                    width: 300,
                    height: 50,
                    child: Padding(
                        padding: EdgeInsets.only(left: 0, top: 15.0),
                        child: Text('FAQ ', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            decoration: TextDecoration.none,
                            fontFamily: 'Poppins',
                            fontSize: 28,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5
                        ),)
                    )
                ),
              ),
            ),

            Positioned(
              top: 190,
              left: 65,
              child:GestureDetector(
                child: Container(
                    width: 300,
                    height: 50,
                    child: Padding(
                        padding: EdgeInsets.only(left: 0, top: 15.0),
                        child: Text('What is live price? ', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            decoration: TextDecoration.none,
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5
                        ),)
                    )
                ),
              ),
            ),
            Positioned(
              top: 240,
              left: 65,
              child:GestureDetector(
                child: Container(
                    width: 320,
                    height: 150,
                    child: Padding(
                        padding: EdgeInsets.only(left: 0, top: 15.0),
                        child: Text('Live prices are created for the prices of silver and gold. However, these are the current prices, which change over time.As a result, the GoldN pays no guarantee.', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            decoration: TextDecoration.none,
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5
                        ),)
                    )
                ),
              ),
            ),

            Positioned(
              top: 400,
              left: 65,
              child:GestureDetector(
                child: Container(
                    width: 350,
                    height: 50,
                    child: Padding(
                        padding: EdgeInsets.only(left: 0, top: 15.0),
                        child: Text('What is manage notifications? ', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            decoration: TextDecoration.none,
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5
                        ),)
                    )
                ),
              ),
            ),

            Positioned(
              top: 445,
              left: 65,
              child:GestureDetector(
                child: Container(
                    width: 320,
                    height: 150,
                    child: Padding(
                        padding: EdgeInsets.only(left: 0, top: 15.0),
                        child: Text('The application allows users to keep or delete their notifications. The delete button will remove all of the selected notifications from the application; this customisation is user-based.  ', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            decoration: TextDecoration.none,
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5
                        ),)
                    )
                ),
              ),
            ),

            Positioned(
              top: 600,
              left: 65,
              child:GestureDetector(
                child: Container(
                    width: 350,
                    height: 50,
                    child: Padding(
                        padding: EdgeInsets.only(left: 0, top: 15.0),
                        child: Text('What is enable notifications?  ', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            decoration: TextDecoration.none,
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5
                        ),)
                    )
                ),
              ),
            ),

            Positioned(
              top: 650,
              left: 65,
              child:GestureDetector(
                child: Container(
                    width: 320,
                    height: 150,
                    child: Padding(
                        padding: EdgeInsets.only(left: 0, top: 15.0),
                        child: Text('Users can toggle their notifications on and off. If the toggle is off, no updates regarding the gold price or forecast will appear in your notification bar.', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            decoration: TextDecoration.none,
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5
                        ),)
                    )
                ),
              ),
            ),

        Positioned(
            top: 880,
            left: 0,
            child: Container(
                width: 430,
                height: 58,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4
                  )
                  ],
                  color: Color.fromRGBO(98, 105, 164, 100),
                  border: Border.all(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    width: 1.5,
                  ),
                )
            )
        ),
            Positioned(
              top: 890,
              left: 79,
              child:GestureDetector(
              child: Icon(
                Icons.home,
                size: 40.0,
              ),
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
            ),
        Positioned(
          top: 890,
          left: 300,
          child:GestureDetector(
            child: Icon(
              Icons.settings,
              size: 40.0,
            ),
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },),
        ),



    ]
    )
    );
  }
}
