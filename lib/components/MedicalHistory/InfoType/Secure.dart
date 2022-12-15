import 'dart:html';

import 'package:app_1/pages/controller/HomeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
            backgroundColor: Colors.black45,
            title: Text(
              'Secure Screen',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Text(
              'This page is secure',
              style: TextStyle(fontSize: 30, color: Colors.yellow),
            ),
          ),
        ),
      ],
    );
  }
}
