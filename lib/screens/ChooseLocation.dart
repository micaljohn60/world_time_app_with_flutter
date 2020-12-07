import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London',location: 'London',flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin',location: 'Berlin',flag: 'germany.png'),
    WorldTime(url: 'Africa/Cairo',location: 'Cairo',flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi',location: 'Nairobi',flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago',location: 'Chicago',flag: 'usa.png'),
    WorldTime(url: 'America/New_York',location: 'New York',flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul',location: 'Seoul',flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta',location: 'Jakarta',flag: 'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location' : instance.location,
      'time' : instance.time,
      'flag' : instance.flag,
      'isDayTime' : instance.isDayTime
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: Text("Choose Location"),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            );
      },),
    );
  }
}
