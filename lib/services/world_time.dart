import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; //location name for the ui
  String? time;//time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api end point
  bool? isDaytime; // true or false if daytime or not

  WorldTime({required this.location, required this.flag,required this.url});

  Future<void> getTime() async{
  try{
    //make the request
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    //print(data);

    //get properties from data
    String datetime = data['utc_datetime'];
    String offset = data['utc_offset'].substring(1,3);
    String offset2 = data['utc_offset'].substring(4,6);
    //print(datetime);
    print(offset2);

    //create datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours:int.parse(offset)));
    now = now.add(Duration(minutes:int.parse(offset2)));
    //set the time property
    isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);
  }
  catch(e){
    print('caught error: $e');
    time = 'error';
    isDaytime = true;
  }


  }
}

