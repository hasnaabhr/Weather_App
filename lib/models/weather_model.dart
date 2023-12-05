class WeatherModel {
  final String cityname;

  final DateTime date;
  final String image;
  final double avg;
  final double maxtemp;
  final double mintemp;
  final String wstatues;

  WeatherModel(
      {required this.cityname,
      required this.date,
      required this.image,
      required this.avg,
      required this.maxtemp,
      required this.mintemp,
      required this.wstatues});

  factory WeatherModel.Fromjson(json) {
    return WeatherModel(
      cityname: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      avg: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      wstatues: json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
