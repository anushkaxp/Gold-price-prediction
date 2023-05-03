import 'package:flutter/material.dart';
import 'package:gold_n/MyLogin.dart';

class First_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 430,
        height: 800,
        decoration: BoxDecoration(
          color : Color.fromRGBO(254, 254, 254, 1),
        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 110,
                  left: 0,
                  child: Container(
                      width: 400,
                      height: 820,
                      decoration: BoxDecoration(
                        image : DecorationImage(
                            image: AssetImage('assets/images/First_image.png'),
                            fit: BoxFit.fitWidth
                        ),
                      )
                  )
              ),Positioned(
                  top: 845,
                  left: 280,
                  child: Text('Next', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'IM FELL Great Primer SC',
                      fontSize: 30,
                      decoration: TextDecoration.none,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 2
                  ),)
              ),Positioned(
                  top: 860,
                  left: 350,
                  child: GestureDetector(
                  child: Container(
                      width: 45,
                      height: 48,

                      decoration: BoxDecoration(

                        image : DecorationImage(
                            image: AssetImage('assets/images/Arrowright.png'),
                            fit: BoxFit.fitWidth
                        ),
                      )

                  ),
                      onTap: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => MyLogin()),
    );
    },
              ),

              ),
            ]
        )
    );
  }
}