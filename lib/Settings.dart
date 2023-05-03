import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold_n/GoldStocks.dart';
import 'package:gold_n/GoldPrice.dart';
import 'package:gold_n/Home.dart';
import 'package:gold_n/MyLogin.dart';
import 'package:gold_n/Notifications.dart';
import 'package:gold_n/ResetPassword.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool status = false;

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
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          },
                        ),
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
                                  child: Text('Settings ', textAlign: TextAlign.center, style: TextStyle(
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
                          top: 130,
                          left: 22,
                          child: Text('App preferences', textAlign: TextAlign.center, style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              decoration: TextDecoration.none,
                              fontFamily: 'Inter',
                              fontSize: 16,
                              letterSpacing: 0 ,
                              fontWeight: FontWeight.normal,
                              height: 1
                          ),)
                      ),



                      Positioned(
                        top: 190,
                        left: 300,
                        child: SizedBox(
                          width: 100,
                          height: 30,
                          child: Switch(
                              activeColor: Colors.grey,
                              value: status,
                              onChanged: (value) {
                                setState(() {
                                  status = value;
                                });
                              }
                          ),
                        ),),

                      Positioned(
                        top: 170,
                        left: 29,

                        child:SizedBox(
                          height: 53,
                          width: 53,
                          child:Icon(status ? Icons.notifications_on : Icons.notifications_off, size: 53,),
                        ),
                      ),

                      Positioned(
                        top: 190,
                        left: 115,

                        child: Text('Enable notification', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            decoration: TextDecoration.none,
                            fontFamily: 'Inter',
                            fontSize: 24,
                            letterSpacing: 0 ,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),),
                      ),


                      Positioned(
                        top: 270,
                        left: 29,
                        child:GestureDetector(

                          child:Icon(Icons.notifications_none_sharp , size: 53,
                          ),
                          onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Notifications()),
                            );
                          },
                        ),
                        ),


                      Positioned(
                        top: 250,
                        left: 100,
                        child:GestureDetector(
                          child: Container(
                              width: 315,
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Color.fromRGBO(98, 105, 164, 1),
                                  ),
                                ),

                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(left: 15.0, top: 18.0),
                                  child: Text(
                                    'Manage Notification',style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      decoration: TextDecoration.none,
                                      fontFamily: 'Maitree',
                                      fontSize: 25,
                                      letterSpacing: 0,
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
                          top: 350,
                          left: 22,
                          child: Text('Privacy & Security', textAlign: TextAlign.left, style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              decoration: TextDecoration.none,
                              fontFamily: 'Inter',
                              fontSize: 16,
                              letterSpacing: 0 ,
                              fontWeight: FontWeight.normal,
                              height: 1
                          ),)
                      ),




                      Positioned(
                        top: 400,
                        left: 29,
                        child:SizedBox(
                          height: 53,
                          width: 53,
                          child:Icon(Icons.lock_person , size: 53,),
                        ),
                      ),

                      Positioned(
                        top: 400,
                        left: 100,
                        child:GestureDetector(
                          child: Container(
                              width: 315,
                              height: 100,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 15.0, top: 18.0),
                                  child: Text('Change Password', textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      decoration: TextDecoration.none,
                                      fontFamily: 'Poppins',
                                      fontSize: 25,
                                      letterSpacing: 0 ,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                  ),)
                              )
                          ),

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ResetPassword()),
                            );
                          },
                        ),

                      ),
                      Positioned(
                        top: 495,
                        left: 29,
                        child:GestureDetector(
                          child: Icon(
                            Icons.delete,
                            size: 40.0,
                          ),
                          onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Settings()),
                            );
                          },
                        ),

                      ),


                      Positioned(
                        top: 480,
                        left: 100,
                        child:GestureDetector(
                          child: Container(
                              width: 315,
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Color.fromRGBO(98, 105, 164, 1),
                                  ),
                                ),

                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(left: 15.0, top: 18.0),
                                  child: Text('Delete Account', textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      decoration: TextDecoration.none,
                                      fontFamily: 'Poppins',
                                      fontSize: 25,
                                      letterSpacing: 0 ,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5,
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
                        left: 100,
                        child:GestureDetector(
                          child: Container(
                              width: 315,
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Color.fromRGBO(98, 105, 164, 1),
                                  ),
                                  bottom: BorderSide(
                                    color: Color.fromRGBO(98, 105, 164, 1),
                                  ),
                                ),

                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(left: 15.0, top: 20.0),
                                  child: Text(
                                    'Log Out',style: TextStyle(
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
                            FirebaseAuth.instance.signOut();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyLogin()));
                          },
                        ),
                      ),



                      Positioned(
                        top: 578,
                        left: 35,
                        child:GestureDetector(
                          child: Icon(
                            Icons.logout_rounded,
                            size: 53.0,
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
                              letterSpacing: 0 ,
                              fontWeight: FontWeight.normal,
                              height: 1
                          ),)
                      ),
                    ]
                )
            )));
  }
}