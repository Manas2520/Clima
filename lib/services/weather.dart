import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';

Future getLocationWeather() async {
  Location location = Location();
  await location.getLocation();

  NetworkHelper networkHelper = NetworkHelper(
      'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric');
  var weatherData = await networkHelper.getData();
  return weatherData;
}
