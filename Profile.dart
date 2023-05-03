import 'package:flutter/material.dart';
import 'package:gold_n/CustomerServer.dart';
import 'package:gold_n/FAQ.dart';
import 'dart:math' as math;import 'dart:math' as math;import 'dart:math' as math;import 'dart:math' as math;import 'dart:math' as math;import 'dart:math' as math;import 'dart:math' as math;
import 'package:gold_n/MyRegister.dart';
import 'package:gold_n/Home.dart';
import 'package:gold_n/MyLogin.dart';
import 'package:gold_n/Notifications.dart';
import 'package:gold_n/Settings.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator ProfileWidget - FRAME
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
              top: 65,
              left: 65,
              child:GestureDetector(
                child: Container(
                    width: 300,
                    height: 50,
                    child: Padding(
                        padding: EdgeInsets.only(left: 0, top: 15.0),
                        child: Text('Profile ', textAlign: TextAlign.center, style: TextStyle(
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
              top: 160,
              left: 29,
              child:GestureDetector(
                child: Container(
                    width: 53,
                    height: 52,
                    decoration: BoxDecoration(
                      image : DecorationImage(
                          image: AssetImage('assets/images/User.png'),
                          fit: BoxFit.fitWidth
                      ),
                      borderRadius : BorderRadius.all(Radius.elliptical(53, 52)),
                    )
                ),
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),
            ),

            Positioned(
              top: 180,
              left: 320,
              child:GestureDetector(
              child:Icon(
                Icons.arrow_forward_ios,
              ),

                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },),
            ),



            Positioned(
        top: 140,
        left: 100,
              child:GestureDetector(
                child: Container(
                    width: 315,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(98, 105, 164, 1),
                        ),
                      ),

                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 18.0),
                        child: Text(
                          'Sai Chaitanya',style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            decoration: TextDecoration.none,
                            fontFamily: 'Maitree',
                            fontSize: 25,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1.5
                        ),)
                    )
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),

    ),

            Positioned(
        top: 200,
        left: 113,
        child:GestureDetector(
        child: Text('+91 9989292898', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            decoration: TextDecoration.none,
            fontFamily:'Maitree',
            fontSize: 14,
            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1
        ),),
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
        ),
    ),

            Positioned(
              top: 260,
              left: 29,
              child:GestureDetector(
                child: Container(
                    width: 50,
                    height: 52,
                    decoration: BoxDecoration(
                      image : DecorationImage(
                          image: AssetImage('assets/images/Prize.png'),

                      ),

                    )
                ),
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),
            ),
            Positioned(
        top: 240,
        left: 100,
              child:GestureDetector(
                child: Container(
                    width: 315,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(98, 105, 164, 1),
                        ),
                      ),

                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 18.0),
                        child: Text(
                          'Invite & Explore',style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            decoration: TextDecoration.none,
                            fontFamily: 'Maitree',
                            fontSize: 25,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1.5
                        ),)
                    )
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),
    ),


            Positioned(
              top: 360,
              left: 29,
              child:GestureDetector(
                child: Container(
                    width: 50,
                    height: 52,
                    decoration: BoxDecoration(
                      image : DecorationImage(
                        image: AssetImage('assets/images/Notification.png'),

                      ),

                    )
                ),
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notifications()),
                  );
                },
              ),
            ),
            Positioned(
        top: 340,
        left: 100,
              child:GestureDetector(
                child: Container(
                    width: 315,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(98, 105, 164, 1),
                        ),
                      ),

                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 18.0),
                        child: Text(
                          'Notifications',style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            decoration: TextDecoration.none,
                            fontFamily: 'Maitree',
                            fontSize: 25,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1.5
                        ),)
                    )
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notifications()),
                  );
                },
              ),
    ),

            Positioned(
              top: 460,
              left: 29,
              child:GestureDetector(
                child: Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      image : DecorationImage(
                        image: AssetImage('assets/images/Settings.png'),

                      ),

                    )
                ),
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
              ),
            ),
            Positioned(
    top: 440,
    left: 100,
              child:GestureDetector(
                child: Container(
                    width: 315,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(98, 105, 164, 1),
                        ),
                      ),

                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 18.0),
                        child: Text(
                          'Settings',style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),decoration: TextDecoration.none,
                            fontFamily: 'Maitree',
                            fontSize: 25,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1.5
                        ),)
                    )
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
              ),
    ),

            Positioned(
              top: 560,
              left: 29,
              child:GestureDetector(
                child: Container(
                    width: 50,
                    height: 52,
                    decoration: BoxDecoration(
                      image : DecorationImage(
                        image: AssetImage('assets/images/Customer Support.png'),

                      ),

                    )
                ),
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomerServer(
                        email: 'saiburugupalli4653@gmail.com'
                    )),
                  );
                },
              ),
            ),
            Positioned(
    top: 540,
    left: 100,
              child:GestureDetector(
                child: Container(
                    width: 315,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(98, 105, 164, 1),
                        ),
                      ),

                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 18.0),
                        child: Text(
                          'Customer Support',style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            decoration: TextDecoration.none,
                            fontFamily: 'Maitree',
                            fontSize: 25,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1.5
                        ),)
                    )
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomerServer(
                        email: 'saiburugupalli4653@gmail.com'
                    )),
                  );
                },
              ),
    ),

            Positioned(
              top: 660,
              left: 29,
              child:GestureDetector(
                child: Container(
                    width: 50,
                    height: 52,
                    decoration: BoxDecoration(
                      image : DecorationImage(
                        image: AssetImage('assets/images/FAQ’s.png'),

                      ),

                    )
                ),
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FAQ()),
                  );
                },
              ),
            ),
            Positioned(
    top: 640,
    left: 100,
              child:GestureDetector(
                child: Container(
                    width: 315,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(98, 105, 164, 1),
                        ),
                      ),

                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 18.0),
                        child: Text(
                          'FAQ’s',style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            decoration: TextDecoration.none,
                            fontFamily: 'Maitree',
                            fontSize: 25,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1.5
                        ),)
                    )
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FAQ()),
                  );
                },
              ),
    ),

            Positioned(
                top: 780,
                left: 200,
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
                          color: Color.fromRGBO(98, 105, 164, 1),
                        ),
                        child:Padding(
                            padding: EdgeInsets.only(left: 25.0, top: 15.0,right: 20),
                            child: Text(
                              'LogOut', textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
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
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyLogin()));
                    },
                  ),
                )
            ),

            Positioned(
              top: 795,
              left: 305,
              child:GestureDetector(
                child: Icon(
                  Icons.logout,
                  size: 40.0,
                ),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyLogin()));
                },
              ),
            ),

            Positioned(
    top: 920,
    left: 300,
    child: Text('version 1.12.657', textAlign: TextAlign.left, style: TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
        decoration: TextDecoration.none,
    fontFamily: 'Inter',
    fontSize: 14,
    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    fontWeight: FontWeight.normal,
    height: 1
    ),)
    ),


    ]
    )
    );

  }
}
        