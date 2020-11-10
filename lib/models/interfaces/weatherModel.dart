class WeatherModerl {
  final String icon;
  final double windSpeed, temp;
  final int windDegre;

  WeatherModerl({this.icon, this.temp, this.windDegre, this.windSpeed});

  factory WeatherModerl.fromJSON(Map<String, dynamic> data) {
    return WeatherModerl(
      icon: data["condition"]["icon"] as String,
      temp: data["temp_c"] as double,
      windDegre: data["wind_degree"] as int,
      windSpeed: data["wind_kph"] as double,
    );
  }
}
