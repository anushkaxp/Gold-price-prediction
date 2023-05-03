import 'package:http/http.dart' as http;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold_n/Home.dart';
import 'package:gold_n/Notifications.dart';
import 'package:gold_n/Profile.dart';
import 'package:gold_n/Settings.dart';
import 'dart:convert';

class SilverPriceService {
  final String apiKey = 'goldapi-erxrlh6nfbs7-io';
  final String SilverPriceUrl = 'https://www.goldapi.io/api/XAG/INR';

  Future<double> getCurrentHighSilver() async {
    final response = await http.get(
        Uri.parse(SilverPriceUrl), headers: {'x-access-token': apiKey});
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final highDouble= json['high_price'];

      final highString = highDouble.toStringAsFixed(2);

      final highDisplaySilver = double.tryParse(highString );
      if (highDisplaySilver != null) {
        return highDisplaySilver;
      }
    }
    throw Exception('Failed to get current high');
  }

  Future<double> getCurrentSilverPrice() async {
    final response = await http.get(
        Uri.parse(SilverPriceUrl), headers: {'x-access-token': apiKey});
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final priceDouble= json['price_gram_24k'];
      final priceString = priceDouble.toStringAsFixed(2);
      final priceSilver = double.tryParse(priceString);
      if (priceSilver != null) {
        return priceSilver;
      }
    }
    throw Exception('Failed to get current gold price');
  }

  Future<double> getCurrentLowSilver() async {
    final response = await http.get(
        Uri.parse(SilverPriceUrl), headers: {'x-access-token': apiKey});
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final lowDouble= json['low_price'];
      final lowString = lowDouble.toStringAsFixed(2);
      final lowDisplaySilver = double.tryParse(lowString );
      if (lowDisplaySilver != null) {
        return lowDisplaySilver;
      }
    }
    throw Exception('Failed to get current low');
  }
  Future<double> getCurrentPrevCloseSilver() async {
    final response = await http.get(
        Uri.parse(SilverPriceUrl), headers: {'x-access-token': apiKey});
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final prevCloseDouble= json['prev_close_price'];

      final prevCloseString = prevCloseDouble.toStringAsFixed(2);

      final prevCloseDisplaySilver = double.tryParse(prevCloseString );
      if (prevCloseDisplaySilver != null) {
        return prevCloseDisplaySilver;
      }
    }
    throw Exception('Failed to get current previous Close');
  }
}

class SilverPrice extends StatefulWidget {
  @override
  State<SilverPrice> createState() => _SilverPriceState();
}

final TextEditingController _highSilverController= TextEditingController();
final TextEditingController _lowSilverController= TextEditingController();
final TextEditingController _closeSilverController= TextEditingController();

String high = _highSilverController.text;
String low = _lowSilverController.text;
String close = _closeSilverController.text;


class _SilverPriceState extends State<SilverPrice> {
  final silverPriceService = SilverPriceService();
  var ResultSilver;


  Future<void> sendSilverDataToServer(String High, String Low, String Close) async {
    final url = 'http://10.7.3.127:5001'
        '/predictSilver';
    Uri uri = Uri.parse(url);
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'High_Price_In_Rs': High,
      'Low_Price_In_Rs': Low,
      'Close_Price_In_Rs': Close
    });

    final response = await http.post(uri, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('Data sent successfully');
      ResultSilver = json.decode(response.body)['Prediction'][0].toString();
      print(ResultSilver);
      return ResultSilver;
    } else {
      print('Failed to send data: ${response.body}');
    }
  }
  void refresh() {
    setState(
            (){

        }
    );
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
                              child: Text('Silver Price ', textAlign: TextAlign.center, style: TextStyle(
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
                      top: 140.29251098632812,
                      left: 35.7946662902832,
                      child: Container(
                          width: 350,
                          height: 180,
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
                    top: 155,
                    left: 59,
                    child: Text('Prev_Open', textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Maitree',
                          fontSize: 25,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                  Positioned(
                    top:150,
                    left: 260,
                    child: Text('75425.0', textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Maitree',
                          fontSize: 25,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                  // Positioned(
                  //   top:150,
                  //   left: 260,
                  //   child: FutureBuilder<double>(
                  //       future: silverPriceService.getCurrentHighSilver(),
                  //       builder: (context, snapshot) {
                  //         if (snapshot.hasData) {
                  //           return Text(
                  //             '${snapshot.data}', style: TextStyle(
                  //             fontSize: 25,color: Color.fromRGBO(255, 255, 255, 1),
                  //           ),);
                  //
                  //         } else if (snapshot.hasError) {
                  //           return Text('Error: ${snapshot.error}',style: TextStyle(
                  //             fontSize: 15,color: Colors.red,
                  //           ),);
                  //         } else {
                  //           return CircularProgressIndicator();
                  //         }
                  //       }
                  //   ),
                  // ),

                  Positioned(
                    top: 210,
                    left: 59,
                    child: Text('Prev_Low', textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Maitree',
                          fontSize: 25,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 220,
                    child: Text(':', textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Maitree',
                          fontSize: 25,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                  Positioned(
                    top: 210,
                    left: 220,
                    child: Text(':', textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Maitree',
                          fontSize: 25,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                  Positioned(
                    top: 270,
                    left: 220,
                    child: Text(':', textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Maitree',
                          fontSize: 25,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                  Positioned(
                    top:210,
                    left: 260,
                    child: Text('73320.0', textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Maitree',
                          fontSize: 25,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                  // Positioned(
                  //   top:210,
                  //   left: 260,
                  //   child: FutureBuilder<double>(
                  //       future: silverPriceService.getCurrentLowSilver(),
                  //       builder: (context, snapshot) {
                  //         if (snapshot.hasData) {
                  //           return Text(
                  //             '${snapshot.data}', style: TextStyle(
                  //             fontSize: 25,color: Color.fromRGBO(255, 255, 255, 1),
                  //           ),);
                  //
                  //         } else if (snapshot.hasError) {
                  //           return Text('Error: ${snapshot.error}',style: TextStyle(
                  //             fontSize: 15,color: Colors.red,
                  //           ),);
                  //         } else {
                  //           return CircularProgressIndicator();
                  //         }
                  //       }
                  //   ),
                  // ),
                  Positioned(
                    top: 270,
                    left: 59,
                    child: Text('Prev_Close', textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Maitree',
                          fontSize: 25,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                  Positioned(
                    top:270,
                    left: 260,
                    child: Text('74243.00', textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Maitree',
                          fontSize: 25,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                  // Positioned(
                  //   top:270,
                  //   left: 260,
                  //   child: FutureBuilder<double>(
                  //       future: silverPriceService.getCurrentPrevCloseSilver(),
                  //       builder: (context, snapshot) {
                  //         if (snapshot.hasData) {
                  //           return Text(
                  //             '${snapshot.data}', style: TextStyle(
                  //             fontSize: 25,color: Color.fromRGBO(255, 255, 255, 1),
                  //           ),);
                  //
                  //         } else if (snapshot.hasError) {
                  //           return Text('Error: ${snapshot.error}',style: TextStyle(
                  //             fontSize: 15,color: Colors.red,
                  //           ),);
                  //         } else {
                  //           return CircularProgressIndicator();
                  //         }
                  //       }
                  //   ),
                  // ),


                  Positioned(
                    top: 340,
                    left: 50,
                    child: Container(
                        width: 320.2685546875,
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
                            padding: EdgeInsets.only(left: 10, top: 3),
                            child: Text(
                              'Present Silver Price :', textAlign: TextAlign.left, style: TextStyle(
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
                    top: 348,
                    left: 230,
                    child: FutureBuilder<double>(
                        future: silverPriceService.getCurrentSilverPrice(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              '${snapshot.data} INR/gm', style: TextStyle(
                                fontSize: 18,color: Color.fromRGBO(0, 0, 0, 1)),
                            );

                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}',style: TextStyle(
                              fontSize: 15,color: Colors.red,
                            ),);
                          } else {
                            return CircularProgressIndicator();
                          }
                        }
                    ),
                  ),

                  Positioned(
                      top: 390,
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
                      top: 435,
                      left: 66.6748046875,
                      child: Text('Previous Open', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Maitree',
                          fontSize: 18,
                          decoration: TextDecoration.none,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),)
                  ),Positioned(
                    top: 460,
                    left: 63.96240234375,
                    child:SizedBox(
                      width: 280,
                      height: 65,
                      child : TextField(
                        controller: _highSilverController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          hintText: ' ',
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

                      ),
                    ),
                  ),

                  Positioned(
                      top: 515,
                      left: 66.6748046875,
                      child: Text('Previous Low', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Maitree',
                          fontSize: 18,
                          decoration: TextDecoration.none,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),)
                  ),Positioned(
                    top: 540,
                    left: 63.96240234375,
                    child:SizedBox(
                      width: 280,
                      height: 65,
                      child : TextField(
                        controller: _lowSilverController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          hintText: ' ',
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

                      ),
                    ),
                  ),

                  Positioned(
                      top: 595,
                      left: 63.96240234375,
                      child: Text('Previous Close', textAlign: TextAlign.left, style: TextStyle(
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
                    top: 620,
                    left: 65,
                    child:SizedBox(
                      width: 280,
                      height: 65,
                      child : TextField(
                        controller: _closeSilverController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          hintText: ' ',
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

                      ),
                    ),
                  ),


                  //BUTTTON
                  Positioned(
                    top: 690,
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
                      onTap: () {
                        sendSilverDataToServer(_highSilverController.text, _lowSilverController.text, _closeSilverController.text);
                        refresh();
                      },
                    ),
                  ),

                  Positioned(
                      top: 795,
                      left: 20,
                      child: Container(
                          width: 380,
                          height: 75,
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
                    top: 760,
                    left: 40,
                    child: Text('Predicted Value:', textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Maitree',
                          fontSize: 22,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),

                  Positioned(
                    top: 815,
                    left: 40,
            child: FutureBuilder<void>(
                future: sendSilverDataToServer(_highSilverController.text, _lowSilverController.text, _closeSilverController.text),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      textAlign: TextAlign.center,
                      '${ResultSilver} INR', style: TextStyle(
                      fontSize: 24,color: Colors.orangeAccent,
                    ),);

                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}',style: TextStyle(
                      fontSize: 20,color: Colors.red,
                    ),);
                  } else {
                    return CircularProgressIndicator();
                  }
                }
            ),),

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
                          MaterialPageRoute(builder: (context) =>Settings()),
                        );
                      },),
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
          ]
        ),),),);
  }
}

