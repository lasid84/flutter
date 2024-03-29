import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:weather_app/model/model.dart';

class WeatherScreen extends StatefulWidget {
  final dynamic parsWeatherData;
  final dynamic parsAirData;
  WeatherScreen({this.parsWeatherData, this.parsAirData});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Model model = Model();
  late String cityName;
  late int temp;
  var date = DateTime.now();
  late Widget icon;
  late String des;

  late Widget airIcon;
  late Widget airState;

  late double dust1;
  late double dust2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parsWeatherData, widget.parsAirData);
  }

  void updateData(dynamic weatherData, dynamic airData) {
    double temp2 = weatherData['main']['temp'];
    temp = temp2.toInt(); //형변환
    temp = temp2.round(); //반올림
    cityName = weatherData['name'];
    int condition = weatherData['weather'][0]['id'];
    icon = model.getWeatherIcon(condition)!;
    des = weatherData['weather'][0]['description'];

    int index = airData['list'][0]['main']['aqi'];
    airIcon = model.getAirIcon(index)!;
    airState = model.getAirCondition(index)!;

    dust1 = airData['list'][0]['components']['pm10'].toDouble();
    dust2 = airData['list'][0]['components']['pm2_5'].toDouble();
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //title: Text(''),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.near_me),
          onPressed: () {},
          iconSize: 30.0,
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.location_searching,
              ),
            onPressed: () {},
            iconSize: 30.0,
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset('image/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          height: 150.0,
                        ),
                        Text(
                          '$cityName',
                          style: GoogleFonts.lato(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            TimerBuilder.periodic(
                              (Duration(minutes: 1)),
                              builder: (context) {
                                  print('${getSystemTime()}');
                                  return Text(
                                    '${getSystemTime()}',
                                    style: GoogleFonts.lato(
                                      fontSize: 16.0,
                                      color: Colors.white
                                    ),
                                  );
                              },
                            ),
                            Text(
                              DateFormat(' - EEEE').format(date),
                              style: GoogleFonts.lato(
                                  fontSize: 16.0,
                                  color: Colors.white
                              ),
                            ),
                            Text(
                              DateFormat('d MMM, yyy').format(date),
                              style: GoogleFonts.lato(
                                  fontSize: 16.0,
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$temp\u00B0',
                    style: GoogleFonts.lato(
                        fontSize: 85.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.white
                    ),
                  ),
                  Row(
                    children: [
                      icon,
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        des,
                        style: GoogleFonts.lato(
                            fontSize: 16.0,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Divider(
                    height: 15.0,
                    thickness: 2.0,
                    color: Colors.white30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'AQI(대기질지수)',
                            style: GoogleFonts.lato(
                                fontSize: 14.0,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          airIcon,
                          SizedBox(
                            height: 10.0,
                          ),
                          airState,
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '미세먼지',
                            style: GoogleFonts.lato(
                                fontSize: 14.0,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '$dust1',
                            style: GoogleFonts.lato(
                                fontSize: 24.0,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'μg/m3',
                            style: GoogleFonts.lato(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '초미세먼지',
                            style: GoogleFonts.lato(
                                fontSize: 14.0,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '$dust2',
                            style: GoogleFonts.lato(
                                fontSize: 24.0,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'μg/m3',
                            style: GoogleFonts.lato(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        ],
      ),
    );
  }
}
