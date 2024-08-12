class WeatherModel {
  String? name;
  double? temp;
  double? maxTemp;
  String? icon;
  int? humidity;
  double? windSpeed;
  double? pressure;

  WeatherModel(
      {required this.name,
      required this.temp,
      required this.maxTemp,
      required this.icon,
      required this.humidity,
      required this.windSpeed,
      required this.pressure});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    var weatherData = json['forecast']['forecastday'][0];
    name = json['location']['name'];
    temp = weatherData['day']['avgtemp_c'];
    maxTemp = weatherData['day']['maxtemp_c'];
    icon = weatherData['day']['condition']['icon'];
    humidity = json['current']['humidity'];
    windSpeed = json['current']['wind_kph'];
    pressure =  pressure = json['current']['pressure_in'];
  }
}
