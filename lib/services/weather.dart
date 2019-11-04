import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = "506d9cae03cbee33676484ac3d3286fc";
const openWeatherMapURI = "test";

class WeatherModel {
  Future<dynamic> getCityWeather(cityName) async {
    String prettyName = "";

    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURI?q=$cityName&units=imperial&appid=$apiKey");

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURI?lat=${location.latitude}&lon=${location.longitude}&units=imperial&appid=$apiKey");

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 78) {
      return 'It\'s 🍦 time';
    } else if (temp > 65) {
      return 'Time for shorts and 👕';
    } else if (temp < 50) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
