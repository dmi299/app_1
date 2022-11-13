

import 'package:app_1/pages/body.dart';
import 'package:app_1/pages/loading.dart';
import 'package:app_1/test.dart';
import 'package:app_1/user/adduser.dart';
import 'package:app_1/user/login.dart';
import 'package:app_1/user/register.dart';
import 'package:flutter/material.dart';
import 'package:app_1/pages/home.dart';
void main() => runApp(MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false, //remove debug mode on appbar
      // initialRoute: '/loading',
      routes: {
        '/': (context) =>  const Loading(),
        '/home': (context) => Home(isUser: false,patient: "",),
        '/body': (context) => const Body(),
        
      },
    ));
