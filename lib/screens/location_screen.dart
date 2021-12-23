import 'package:clima/utilities/textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationScreen extends StatefulWidget {
  var locationWeather;
  LocationScreen(this.locationWeather);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var temperature,
      visibility,
      pressure,
      feelsLike,
      description,
      cityName,
      humidity,
      windSpeed,
      country,
      icon;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(var weatherData) {
    setState(() {
      if (weatherData == null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error!'),
              content: Text(
                  'There was an error in obtaining the weather data.Please try again after some time!'),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      }
      double temp, temp2;
      temp = weatherData['main']['temp'];
      temp2 = weatherData['main']['feels_like'];
      visibility = weatherData['visibility'];
      pressure = weatherData['main']['pressure'];
      icon = weatherData['weather'][0]['icon'];
      country = weatherData['sys']['country'];
      windSpeed = weatherData['wind']['speed']; // m/s
      humidity = weatherData['main']['humidity'];
      temperature = temp.toInt();
      feelsLike = temp2.toInt();
      description = weatherData['weather'][0]['description'];
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                  'http://openweathermap.org/img/wn/$icon@2x.png'),
                              Text(
                                '$temperature°C',
                                style: TextStyle(fontSize: 40),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '$cityName,$country',
                          style: GoogleFonts.comfortaa(
                            textStyle: kWeatherInfoTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$description,feels like $feelsLike°C',
                          style: GoogleFonts.comfortaa(
                            textStyle: kWeatherInfoTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Ruler(),
                      Expanded(
                        child: InfoTile('Humidity', '$humidity %'),
                      ),
                      Ruler(),
                      Expanded(
                        child: InfoTile('Wind Speed', '$windSpeed m/s'),
                      ),
                      Ruler(),
                      Expanded(
                        child: InfoTile(
                          'Pressure',
                          '$pressure hPa',
                        ),
                      ),
                      Ruler(),
                      Expanded(
                        child:
                            InfoTile('Visibility', '${visibility / 1000} km'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
