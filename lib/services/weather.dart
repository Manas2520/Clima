import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';
import 'package:location/location.dart';

Future getLocationWeather() async {
  var currentLocation = Location();
  var location = await currentLocation.getLocation();
  NetworkHelper networkHelper = NetworkHelper(
      'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric');
  var weatherData = await networkHelper.getData();
  return weatherData;
}
