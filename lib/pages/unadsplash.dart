import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unad_app/helpers/utils.dart';
import 'package:unad_app/pages/unadlogin.dart';

class UNADSplash extends StatefulWidget {
  const UNADSplash({Key? key}) : super(key: key);

  @override
  State<UNADSplash> createState() => _UNADSplashState();
}

class _UNADSplashState extends State<UNADSplash> {

  late Timer timer;

  @override 
  void initState() {
    super.initState();

    timer = Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => UNADLogin())
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      body: Stack( 
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/imgs/unadlogo.png'),
                Image.asset('assets/imgs/unadlogotext.png'),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    valueColor: AlwaysStoppedAnimation(Utils.mainColor.withOpacity(0.5)),
                  )
                )
              ],
            ),
          ),
          Positioned(
            bottom: -220,
            left: (MediaQuery.of(context).size.width * .5) * -1,
            child: Transform.rotate(
              angle: .2,
              child: Container(
                width: MediaQuery.of(context).size.width * 2,
                height: 300,
                color: Utils.mainColor
              ),
            ),
          ),
          Positioned(
            bottom: -190,
            left: (MediaQuery.of(context).size.width * .5) * -1,
            child: Transform.rotate(
              angle: .15,
              child: Container(
                width: MediaQuery.of(context).size.width * 2,
                height: 300,
                color: Utils.mainColor.withOpacity(0.75)
              ),
            ),
          ),
          Positioned(
            bottom: -160,
            left: (MediaQuery.of(context).size.width * .5) * -1,
            child: Transform.rotate(
              angle: .1,
              child: Container(
                width: MediaQuery.of(context).size.width * 2,
                height: 300,
                color: Utils.mainColor.withOpacity(0.5)
              ),
            ),
          )
        ],
      )
    );
  }
}