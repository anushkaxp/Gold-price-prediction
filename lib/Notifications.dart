import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold_n/Home.dart';
import 'package:gold_n/Notifications.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications extends StatefulWidget {
  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

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
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
            ),

            Positioned(
                top: 70,
                left: 340,
                child: Container(
                  width: 21,
                  height: 22,
                  child: Icon(Icons.delete,size: 40,color: Colors.white60),
                )
            ),

            Positioned(
              top: 70,
              left: 65,
              child:GestureDetector(
                child: Container(
                    width: 300,
                    height: 50,
                    child: Padding(
                        padding: EdgeInsets.only(left: 0, top: 15.0),
                        child: Text('Notifications ', textAlign: TextAlign.center, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            decoration: TextDecoration.none,
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),)
                    )
                ),


              ),
            ),
              Positioned(
                  top: 120,
                  left:15,
                  child: Column(
                    children: [
                  Container(
                    width: 390,
                        height: 130,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 1,
                        )
                      )
                    ),

                    child: Row(
                            children: [
                             Container(
                                  width: 70,
                                  height:70 ,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/Stockslogo.png'),
                                        fit: BoxFit.fitWidth
                                    ),
                                  )
                              ),
                        Padding(
                            padding: EdgeInsets.only(left: 30),
                        child: Text('Gold price update:\n1-day hike: Rs.+0.20 | +0.1%\nSilver price update: \n1-day hike: Rs. +0.12 | +0.60%', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1.5
                        ),)
                  ),
                              Padding(
                                  padding: EdgeInsets.only(top: 100, left: 20),
                                  child: Text('3days ago', textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(245, 245, 245, 1),
                                      decoration: TextDecoration.none,
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5
                                  ),)
                              )
                          ]),
              ),

                      Container(
                        width: 390,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                )
                            )
                        ),

                        child: Row(
                            children: [
                              Container(
                                  width: 70,
                                  height:70 ,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/Stockslogo.png'),
                                        fit: BoxFit.fitWidth
                                    ),
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text('Gold price update:\n1-day hike: Rs.+0.29 | +0.2%\nSilver price update: \n1-day hike: Rs. +0.22 | +0.20%', textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'Poppins',
                                      decoration: TextDecoration.none,
                                      fontSize: 15,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5
                                  ),)
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 100, left: 20),
                                  child: Text('5 days ago', textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(245, 245, 245, 1),
                                      decoration: TextDecoration.none,
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5
                                  ),)
                              )
                            ]),
                      ),




                    ]),)
    ]
    )
    );
  }
}
