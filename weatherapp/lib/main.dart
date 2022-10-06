import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weatherapp/customwidget.dart';
import 'package:weatherapp/models/weathermodel.dart';
import 'package:weatherapp/services/weather_api_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Testing Api Call
  String location = "dubai";
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather(location);
  }

  setCityName(String name) {
    location = name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          elevation: 0,
          title: Text(
            "WEATHERAPP",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            color: Colors.amber,
          ),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  currentWeather(Icons.wb_sunny_rounded, "${data!.temp}",
                      "${data!.cityName}"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Today's Highlights",
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Color(0xdd212121),
                        fontWeight: FontWeight.bold),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  additionalInfo("${data!.wind} kp_h", "${data!.pressure}",
                      "${data!.feel}c", "${data!.humidity}%")
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ));
  }
}
