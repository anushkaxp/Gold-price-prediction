
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold_n/Home.dart';
import 'package:gold_n/Profile.dart';
import 'package:gold_n/Settings.dart';


class CustomerServer extends StatefulWidget {
  final String email;

  CustomerServer({required this.email});

  @override
  State<CustomerServer> createState() => _CustomerServerState();
}

class _CustomerServerState extends State<CustomerServer> {
  void _launchEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: widget.email,
    );

    String url = params.toString();

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Material(
          child: Container(
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
                          MaterialPageRoute(builder: (context) =>Profile()),
                        );
                      },
                    ),
                  ),


                  Positioned(
                    top: 73,
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
                    top: 65,
                    left: 65,
                    child:GestureDetector(
                      child: Container(
                          width: 300,
                          height: 50,
                          child: Padding(
                              padding: EdgeInsets.only(left: 0, top: 15.0),
                              child: Text('Customer Support ', textAlign: TextAlign.center, style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Poppins',
                                  fontSize: 28,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1
                              ),)
                          )
                      ),
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: 60,
                    child:GestureDetector(
                      child: Container(
                          width: 300,
                          height: 70,
                          child: Padding(
                              padding: EdgeInsets.only(left: 0, top: 15.0),
                              child: Text('Contact Agent:', textAlign: TextAlign.left, style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5
                              ),)
                          )
                      ),
                    ),
                  ),

                  Positioned(
                    top: 208,
                    left: 10,
                    child:GestureDetector(
                      child: Icon(
                        Icons.support_agent,
                        size: 40.0,
                      ),

                    ),
                  ),
                  Positioned(
                    top: 190,
                    left: 65,
                    child:GestureDetector(
                      child: Container(
                          width: 320,
                          height: 150,
                          child: Padding(
                              padding: EdgeInsets.only(left: 0, top: 15.0),
                              child: Text('Name:', textAlign: TextAlign.left, style: TextStyle(
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
                    top: 195,
                    left: 150,
                    child:GestureDetector(
                      child: Container(
                          width: 320,
                          height: 150,
                          child: Padding(
                              padding: EdgeInsets.only(left: 0, top: 15.0),
                              child: Text('Jack', textAlign: TextAlign.left, style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Poppins',
                                  fontSize: 22,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5
                              ),)
                          )
                      ),
                    ),
                  ),

                  Positioned(
                    top: 270,
                    left: 10,
                    child:GestureDetector(
                      child: Icon(
                        Icons.phone,
                        size: 40.0,
                      ),

                    ),
                  ),
                  Positioned(
                    top: 250,
                    left: 65,
                    child:GestureDetector(
                      child: Container(
                          width: 320,
                          height: 150,
                          child: Padding(
                              padding: EdgeInsets.only(left: 0, top: 15.0),
                              child: Text('Phone:', textAlign: TextAlign.left, style: TextStyle(
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
                    top: 255,
                    left: 150,
                    child:GestureDetector(
                      child: Container(
                          width: 320,
                          height: 150,
                          child: Padding(
                              padding: EdgeInsets.only(left: 0, top: 15.0),
                              child: Text('1808080800', textAlign: TextAlign.left, style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Poppins',
                                  fontSize: 22,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5
                              ),)
                          )
                      ),
                    ),
                  ),
                  Positioned(
                    top: 330,
                    left: 10,
                    child:GestureDetector(
                      child: Icon(
                        Icons.mail_outline_rounded,

                        size: 40.0,
                      ),

                    ),
                  ),
                  Positioned(
                    top: 315,
                    left: 65,
                    child:GestureDetector(
                      child: Container(
                          width: 320,
                          height: 150,
                          child: Padding(
                              padding: EdgeInsets.only(left: 0, top: 15.0),
                              child: Text('Email:', textAlign: TextAlign.left, style: TextStyle(
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
                    top: 318,
                    left: 150,
                    child:GestureDetector(
                      child: Container(

                          child: Padding(
                              padding: EdgeInsets.only(left: 0, top: 15.0),
                              child: Text('jack.support@gmail.com', textAlign: TextAlign.left, style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Poppins',
                                  fontSize: 22,
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
                      left: 130,
                      child: Transform.rotate(
                        angle: 1.5902773407317584e-15 * (math.pi / 180),
                        child: GestureDetector(
                          child: Container(
                              width: 170,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                                color: Colors.indigo,
                              ),
                              child:Padding(
                                  padding: EdgeInsets.only(left: 25.0, top: 15.0,right: 20),
                                  child: Text(
                                    'Contact Now', textAlign: TextAlign.left, style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'Maitree',
                                      fontSize: 20,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5
                                  ),)
                              )
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CustomerServer(email: 'saiburugupalli4653@gmail.com')),
                            );
                          },
                        ),
                      )
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
            ),),)
    );
  }
}

