  import 'package:flutter/material.dart';
  import 'package:http/http.dart' as http;
  import 'package:gold_n/Notifications.dart';
  import 'package:gold_n/Profile.dart';
  import 'package:gold_n/GoldPrice.dart';
  import 'package:gold_n/Settings.dart';
  import 'package:gold_n/SilverPrice.dart';
  import 'package:gold_n/GoldStocks.dart';
  import 'dart:convert';
  import 'dart:math' as math;

  class GoldPriceService {
    final String apiKey = 'goldapi-erxrlh6nfbs7-io';
    final String goldPriceUrl = 'https://www.goldapi.io/api/XAU/INR';

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
    }}

  class SilverPriceService {
    final String apiKey = 'goldapi-erxrlh6nfbs7-io';
    final String silverPriceUrl = 'https://www.goldapi.io/api/XAG/INR';

    Future<double> getCurrentSilverPrice() async {
      final response = await http.get(
          Uri.parse(silverPriceUrl), headers: {'x-access-token': apiKey});
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
    }}

  class InflationRateService {
    final String inflationapiKey = 'qZ5cqnodngxXSr+PjL7wuQ==KO56F6PbJRRSjuCT';
    final String InflationUrl = 'https://api.api-ninjas.com/v1/exchangerate?pair=USD_INR';

    Future<double> fetchExchangeRate() async {
      final response = await http.get(
          Uri.parse(InflationUrl), headers: {'x-access-token': inflationapiKey});
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final priceDouble= json['exchange_rate'];
        final priceString = priceDouble.toStringAsFixed(2);
        final price = double.tryParse(priceString);
        if (price != null) {
          return price;
        }
      }
      throw Exception('Failed to get current gold price');
    }}



  class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  Future<void> _refreshData() async {


  }
    final goldPriceService = GoldPriceService();

    final silverPriceService = SilverPriceService();

    @override
    Widget build(BuildContext context) {

      return MaterialApp(
      home: Material(
        child: Container(
          width: 360,
          height: 800,
          decoration: BoxDecoration(
            color: Color.fromRGBO(48, 52, 99, 1),
          ),
      child: RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _refreshData,
          child: Stack(
              children: <Widget>[
                 Positioned(
                    top: 70,
                    left: 40,
                    child: Transform.rotate(
                      angle: 1.5902773407317584e-15 * (math.pi / 180),
                      child: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/App logo.png'),
                                fit: BoxFit.fitWidth
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(54, 48)),
                          )
                      ),
                    )
                ), Positioned(
                  top: 70,
                  left: 105,
                  child:SizedBox(
                    width: 220,
                    height: 50,
                    child : TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Search GoldN',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF6269A4),
                      ),
                    ),
                  ),
                ),


                Positioned(
                    top: 70,
                    left: 334,
                    child: GestureDetector(
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/User.png'),
                              fit: BoxFit.fitWidth
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(51, 48)),
                        )
                    ),
                        onTap: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => Profile()),
                );
                },
                ),),

                Positioned(
                    top: 80,
                    left: 120,
                    child: Icon(
                      Icons.search,
                      size: 30.0,
                        ),
                    ),

  //Live Price
                Positioned(
                    top: 155,
                    left: 45,
                    child: Container(
                        width: 340,
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.0, top: 18.0),
                        child: Text('Live Gold Price:', textAlign: TextAlign.left,
                        style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Maitree',
                        fontSize: 20,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                    ),)),
                  ),


                Positioned(
                    top: 171,
                    left: 220,
                  child: FutureBuilder<double>(
                      future: goldPriceService.getCurrentGoldPrice(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            '${snapshot.data} INR/gm', style: TextStyle(
                            fontSize: 20,color: Color.fromRGBO(255, 255, 255, 1),
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
                    top: 242,
                    left: 45,
                    child: Container(
                        width: 340,
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      child: Padding(
                          padding: EdgeInsets.only(left: 30.0, top: 18.0),
                          child: Text('Live Silver Price:', textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Maitree',
                                fontSize: 20,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),)
                      )
                    )
                ),

                    Positioned(
                    top: 258,
                    left: 230,
                      child: FutureBuilder<double>(
                          future: silverPriceService.getCurrentSilverPrice(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                '${snapshot.data} INR/gm', style: TextStyle(
                                fontSize: 20,color: Color.fromRGBO(255, 255, 255, 1),
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

  //Pridict

                Positioned(
                    top: 340,
                    left: 55,
                    child: Text(
                      'Predict:', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Maitree',
                        fontSize: 28,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.bold,
                        height: 1
                    ),)
                ),
                Positioned(
                    top: 395,
                    left: 45,
                    child: Transform.rotate(
                      angle: 1.5902773407317584e-15 * (math.pi / 180),
                      child: GestureDetector(
                      child: Container(
                          width: 340,
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
                              padding: EdgeInsets.only(left: 50.0, top: 18.0),
                              child: Text(
                                'Gold Price', textAlign: TextAlign.left, style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
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
                              MaterialPageRoute(builder: (context) => GoldPrice()),
                              );
                          },
                      ),
                    )
                ),

                Positioned(
                    top: 405,
                    left: 280,
                    child:GestureDetector(
                    child: Container(
                        width: 60,
                        height:60 ,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/Gold.png'),
                              fit: BoxFit.fitWidth
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(30, 34)),
                        )
                    ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GoldPrice()),
                        );
                      },
                    ),
                ),
                Positioned(
                  top: 495,
                  left: 45,
                  child:GestureDetector(
                    child: Container(
                        width: 340,
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
                        child: Padding(
                            padding: EdgeInsets.only(left: 50.0, top: 18.0),
                            child: Text(
                              'Silver Price', textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
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
                        MaterialPageRoute(builder: (context) => SilverPrice()),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 490,
                  left: 280,
                  child:GestureDetector(
                    child: Container(
                        width: 70,
                        height:70 ,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/Silver.png'),
                              fit: BoxFit.fitWidth
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(30, 34)),
                        )
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SilverPrice()),
                      );
                    },
                  ),
                ),



                //Inflation
                Positioned(
                    top: 593,
                    left: 55,
                    child: Text(
                      'Inflation:', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Maitree',
                        fontSize: 28,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.bold,
                        height: 1
                    ),)
                ),
                Positioned(
                    top: 640,
                    left: 50,
                    child: Transform.rotate(
                      angle: 1.5902773407317584e-15 * (math.pi / 180),
                      child: Container(
                          width: 340,
                          height: 127,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            color: Color.fromRGBO(98, 105, 164, 1),
                          )
                      ),
                    )
                ),

                Positioned(
                    top: 720,
                    left: 100,
                    child: Text(
                      '1 USD ', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Maitree',
                        fontSize: 20,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),)
                ),

                Positioned(
                    top: 670,
                    left: 200,
                    child: Text('=', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Maitree',
                        fontSize: 20,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),)
                ),



                Positioned(
                    top: 670,
                    left: 95,
                    child: Text(
                      'Us Dollar', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Maitree',
                        fontSize: 20,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),)
                ), Positioned(
                    top: 670,
                    left: 250,
                    child: Text(
                      'Indian Rupee ', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Maitree',
                        fontSize: 20,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),)
                ),

                Positioned(
                    top: 720,
                    left: 200,
                    child: Text('=', textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Maitree',
                        fontSize: 20,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),)
                ),

                Positioned(
                    top: 713,
                    left: 250,
                    child: FutureBuilder<double>(
                        future: InflationRateService().fetchExchangeRate(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              '${snapshot.data} INR', style: TextStyle(
                              fontSize: 20,color: Colors.orangeAccent,
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
                          color: Color.fromRGBO(98, 105, 164, 1),
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
                         MaterialPageRoute(builder: (context) => Notifications()),
                       );
                     },
                ),

                 ),

                Positioned(
                  top: 810,
                  left:350,
                  child:FloatingActionButton(
                    onPressed: () {
                      setState(() {}); // Reload the page
                    },
                    backgroundColor: Colors.deepPurpleAccent,
                    child: Icon(Icons.refresh),
                  ),

                ),

              ]
          ),),
      )),);
    }
}