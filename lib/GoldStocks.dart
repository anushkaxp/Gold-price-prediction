
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold_n/Home.dart';
import 'package:gold_n/Profile.dart';
import 'package:gold_n/Settings.dart';



class GoldStocks extends StatefulWidget {
  @override
  State<GoldStocks> createState() => _GoldStocksState();
}

class _GoldStocksState extends State<GoldStocks> {
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
                    top: 890,
                    left: 79,
                    child: Icon(
                      Icons.notifications,
                      size: 40.0,
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
                    top: 68,
                    left: 65,
                    child:GestureDetector(
                      child: Container(
                          width: 300,
                          height: 50,
                          child: Padding(
                              padding: EdgeInsets.only(left: 0, top: 15.0),
                              child: Text('Gold Stocks ', textAlign: TextAlign.center, style: TextStyle(
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
                      top: 149,
                      left: 40,
                      child: Text('Updated Gold Stocks ', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Maitree',
                          fontSize: 18,
                          decoration: TextDecoration.none,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),)
                  ),
                  Positioned(
                      top: 176,
                      left: 40,
                      child: Text('09: 10 AM Last updated', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Maitree',
                          decoration: TextDecoration.none,
                          fontSize: 18,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),)
                  ),

                  Positioned(
                      top: 210.29251098632812,
                      left: 35.7946662902832,
                      child: Container(
                          width: 350,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color : Color.fromRGBO(0, 0, 0, 1),
                          )
                      )
                  ),

                  Positioned(
                    top: 380,
                    left: 80,
                    child: Container(
                        width: 280.2685546875,
                        height: 35.1912841796875,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(left: 20, top: 3),
                            child: Text(
                              'Present Stock Value:', textAlign: TextAlign.left, style: TextStyle(
                                color : Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Maitree',
                                fontSize: 18,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1.5
                            ),)
                        )
                    ),
                  ),


                  Positioned(
                      top: 390,
                      left: 270,
                      child: Text('\$ 300', textAlign: TextAlign.right, style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Maitree',
                          decoration: TextDecoration.none,
                          fontSize: 18,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),)
                  ),

                  Positioned(
                      top: 430,
                      left: 140,
                      child: Text('Predict price', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Maitree',
                          decoration: TextDecoration.none,
                          fontSize: 24,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),)
                  ),

                  Positioned(
                      top: 470,
                      left: 63.96240234375,
                      child: Text('No of Shares', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Maitree',
                          decoration: TextDecoration.none,
                          fontSize: 18,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),)
                  ),

                  Positioned(
                    top: 510,
                    left: 65,
                    child:SizedBox(
                      width: 280,
                      height: 65,
                      child : TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Enter no.of Shocks',
                          hintStyle: TextStyle(
                            color: Colors.white54,
                          ),
                          contentPadding: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
                          filled: true,
                          fillColor: const Color(0xFF6269A4),
                        ),
                        maxLength: 8,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          color: Colors.white, // set the color of the text
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ),Positioned(
                      top: 570,
                      left: 66.6748046875,
                      child: Text('Date', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Maitree',
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),)
                  ),Positioned(
                    top: 610,
                    left: 63.96240234375,
                    child:SizedBox(
                      width: 280,
                      height: 65,
                      child : TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'YYYY/MM/DD',
                          hintStyle: TextStyle(
                            color: Colors.white54,
                          ),
                          contentPadding: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
                          filled: true,
                          fillColor: const Color(0xFF6269A4),
                        ),
                        maxLength: 8,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          color: Colors.white, // set the color of the text
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ),

                  //BUTTTON
                  Positioned(
                    top: 680,
                    left: 101.55859375,
                    child: GestureDetector(
                      child: Container(
                          width: 180.92431640625,
                          height: 45.62158203125,
                          child: Center(
                            child: Text('Predict', textAlign: TextAlign.left, style: TextStyle(
                                fontFamily: 'Maitree',
                                decoration: TextDecoration.none,
                                fontSize: 20,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.bold
                                ,
                                height: 1
                            ),
                            ),),
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            // color : Color.fromRGBO(255, 212, 100, 1),
                            color : Colors.grey,
                          )
                      ),
                      // onTap: () {
                      //   Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Home()),
                      //   );
                      // },
                    ),
                  ),
                  Positioned(
                      top: 750,
                      left: 40,
                      child: Container(
                          width: 350,
                          height: 95,
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color : Color.fromRGBO(0, 0, 0, 1),
                          )
                      )
                  ),Positioned(
                      top: 765,
                      left: 125,
                      child: Text('\$ 500', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(255, 0, 0, 1),
                          fontFamily: 'Maitree',
                          decoration: TextDecoration.none,
                          fontSize: 75,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),)
                  ),

                  //tail
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
                              width: 1,
                            ),
                          )
                      )
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


                  Positioned(
                    top: 890,
                    left: 79,
                    child:GestureDetector(
                      child: Icon(
                        Icons.notifications,
                        size: 40.0,
                      ),
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Settings()),
                        );
                      },
                    ),

                  ),


                ]
            ),),)
    );
  }
}

