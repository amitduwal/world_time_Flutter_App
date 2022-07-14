import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Kathmandu', flag: 'nepal.png', url: 'Asia/Kathmandu');
    await instance.getTime();
    //print(instance.time);
    Navigator.pushReplacementNamed(context,'/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime
    }
    );

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),

      ),
    );
  }
}
