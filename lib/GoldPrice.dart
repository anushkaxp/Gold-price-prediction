import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold_n/Home.dart';
import 'package:gold_n/Notifications.dart';
import 'package:gold_n/Profile.dart';
import 'package:gold_n/Settings.dart';
import 'dart:convert';


class GoldPriceService {
  final String apiKey = 'goldapi-erxrlh6nfbs7-io';
  final String goldPriceUrl = 'https://www.goldapi.io/api/XAU/INR';

  Future<double> getCurrentHigh() async {
    final response = await http.get(
        Uri.parse(goldPriceUrl), headers: {'x-access-token': apiKey});
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final highDouble= json['high_price'];

      final highString = highDouble.toStringAsFixed(2);

      final highDisplay = double.tryParse(highString );
      if (highDisplay != null) {
        return highDisplay;
      }
    }
    throw Exception('Failed to get current high');
  }

  Future<double> getCurrentGoldPrice() async {
    final response = await http.get(
        Uri.parse(goldPriceUrl), headers: {'x-access-token': apiKey});
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final priceDouble= json['price_gram_24k'];
      final priceString = priceDouble.toStringAsFixed(2);
      final price = double.tryParse(priceString);
      if (price != null) {
        return price;
      }
    }
    throw Exception('Failed to get current gold price');
  }

  Future<double> getCurrentLow() async {
    final response = await http.get(
        Uri.parse(goldPriceUrl), headers: {'x-access-token': apiKey});
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);

      final lowDouble= json['low_price'];

      final lowString = lowDouble.toStringAsFixed(2);
      final lowDisplay = double.tryParse(lowString );
      if (lowDisplay != null) {
        return lowDisplay;
      }
    }
    throw Exception('Failed to get current low');
  }
  Future<double> getCurrentPrevClose() async {
    final response = await http.get(
        Uri.parse(goldPriceUrl), headers: {'x-access-token': apiKey});
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final prevCloseDouble= json['prev_close_price'];

      final prevCloseString = prevCloseDouble.toStringAsFixed(2);

      final prevCloseDisplay = double.tryParse(prevCloseString );
      if (prevCloseDisplay != null) {
        return prevCloseDisplay;
      }
    }
    throw Exception('Failed to get current previous Close');
  }
}


class GoldPrice extends StatefulWidget {
  @override
  State<GoldPrice> createState() => _GoldPriceState();
}
final TextEditingController _highController= TextEditingController();
final TextEditingController _lowController= TextEditingController();
final TextEditingController _closeController= TextEditingController();

String high = _highController.text;
String low = _lowController.text;
String close = _closeController.text;







class _GoldPriceState extends State<GoldPrice> {
  final goldPriceService = GoldPriceService();
  var Result;


  Future<void> sendDataToServer(String High, String Low, String Close) async {
    final url = 'http://10.7.3.127:5000/predict';
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
      Result = json.decode(response.body)['Prediction'][0].toString();
      print(Result);
      return Result;
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
                              child: Text('Gold Price ', textAlign: TextAlign.center, style: TextStyle(
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
                    child: Text('60771.0', textAlign: TextAlign.left,
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
                  //       future: goldPriceService.getCurrentHigh(),
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
                    child: Text('59700.0', textAlign: TextAlign.left,
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
                  //       future: goldPriceService.getCurrentLow(),
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
                    child: Text('59764.00', textAlign: TextAlign.left,
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
                  //       future: goldPriceService.getCurrentPrevClose(),
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
                          width: 330,
                          height: 40,
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
                                'Present Gold Price :', textAlign: TextAlign.left, style: TextStyle(
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
                      left: 220,
                    child: FutureBuilder<double>(
                        future: goldPriceService.getCurrentGoldPrice(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              '${snapshot.data} INR/gm', style: TextStyle(
                              fontSize: 20,color: Colors.black,
                            ),);

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
                        controller: _highController,
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
                        maxLength: 14,
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
                        controller: _lowController,
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
                        maxLength: 14,
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
                        controller: _closeController,
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
                        maxLength: 14,
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
                        sendDataToServer(_highController.text, _lowController.text, _closeController.text);
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
                future: sendDataToServer(_highController.text, _lowController.text, _closeController.text),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      textAlign: TextAlign.center,
                      '${Result} INR', style: TextStyle(


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
            ),),)
    );
  }
}

