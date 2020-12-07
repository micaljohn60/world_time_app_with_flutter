import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}



class _LoadingState extends State<Loading> {

  void setUpWorldTime() async {
   WorldTime instance = WorldTime(url: 'Europe/Berlin',location: 'Berlin',flag: 'germany.png');

   await instance.getTime();
   print(instance.time);
   setState (() {
     Navigator.pushReplacementNamed(context, '/home' ,arguments: {
       'location' : instance.location,
       'time' : instance.time,
       'flag' : instance.flag,
       'isDayTime' : instance.isDayTime
     });
   });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        )
      ),
    );
  }
}
