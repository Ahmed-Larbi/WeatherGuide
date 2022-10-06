import 'package:flutter/material.dart';

Widget currentWeather(IconData icon, String temp, String location) {
  return Center(
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              icon,
              color: Colors.orange,
              size: 64.0,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "$temp C",
            style: TextStyle(fontSize: 46.0),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            location,
            style: TextStyle(fontSize: 18, color: Color(0xFF5a5a5a)),
          )
        ]),
  );
}

Widget additionalInfo(
    String wind, String pressure, String feel, String humidity) {
  TextStyle titlesFont =
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 18);

  TextStyle detailsFont =
      const TextStyle(fontWeight: FontWeight.w400, fontSize: 18);

  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.0),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wind",
                    style: titlesFont,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Pressure", style: titlesFont),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wind,
                    style: detailsFont,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(pressure, style: detailsFont),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Feel", style: titlesFont),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Humidity", style: titlesFont),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    feel,
                    style: detailsFont,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(humidity, style: detailsFont),
                ],
              ),
            ],
          )
        ]),
  );
}
