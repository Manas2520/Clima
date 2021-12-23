import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/utilities/textstyles.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var weatherData;

  void getLocationData() async {
    weatherData = await getLocationWeather();
    await Future.delayed(Duration(milliseconds: 6000));
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData);
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Clima',
                      style: GoogleFonts.comfortaa(
                        textStyle: kLoadingScreenTitleTextStyle,
                      ),
                    ),
                    Text(
                      'A weather app powered by : ',
                      style: GoogleFonts.comfortaa(
                        textStyle: kLoadingScreenBodyTextStyle,
                      ),
                    ),
                    Image.asset(
                      'assets/images/flutter.gif',
                      scale: 4,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: SpinKitSpinningLines(
                  color: Colors.black,
                  size: 100.0,
                  duration: Duration(milliseconds: 2000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
