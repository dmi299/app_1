// import 'dart:js';

// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupLoadingTime() async {
    Future.delayed(const Duration(seconds: 5), () async {
      Navigator.pushReplacementNamed(context, '/home');
      // await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    });
  }

  @override
  void initState() {
    super.initState();
    setupLoadingTime();
    // setupStopCatureandRecord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Image.asset(
          'images/logo.png',
          width: 200,
          // scale: 1.0,
        ),
        // padding: EdgeInsets.all(50.0),
        // child: SpinKitThreeInOut(
        //     color: Colors.white,
        //     size: 50.0,
        //     duration: Duration(milliseconds: 1200)),
      ),
    );
  }
}

// class FlightImageAsset extends StatelessWidget {
//   const FlightImageAsset({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     AssetImage assetImage = const AssetImage('images/logo.png');
//     Image image = Image(image: assetImage);
//     return Center(child: image,);
//   }
// }
