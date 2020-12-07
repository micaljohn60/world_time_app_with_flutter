import 'package:flutter/material.dart';
import 'package:world_time_app/screens/ChooseLocation.dart';
import 'package:world_time_app/screens/Home.dart';
import 'package:world_time_app/screens/Loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),
      '/home' : (context) =>  Home(),
      '/location' : (context) => ChooseLocation()
    },
  ));
}


