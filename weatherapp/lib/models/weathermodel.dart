class Weather {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feel;
  double? pressure;

  Weather(
      {this.cityName,
      this.temp,
      this.wind,
      this.humidity,
      this.feel,
      this.pressure});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['location']['name'];
    temp = json["current"]["temp_c"];
    wind = json["current"]["wind_mph"];
    humidity = json["current"]["humidity"];
    feel = json["current"]["feelslike_c"];
    pressure = json["current"]["pressure_mb"];
  }
}
