import 'package:clima/services/networking.dart';
import 'package:geolocator/geolocator.dart';

import 'location.dart';

class WeatherModel {
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
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  dynamic getWeatherDataByLocation(final String cityName) async {
    Map<String, String> queryParams = {
      'q': cityName,
      'appid': 'e81c9dab1b9ac4e037e119341b1ef133',
      'units': 'metric'
    };
    var url =
        Uri.https('api.openweathermap.org', 'data/2.5/weather', queryParams);

    print(url);

    return Network.getNetworkResponse(url);
  }

  dynamic getWeatherDataByCoordinates() async {
    Position location = await determinePosition();

    Map<String, String> queryParams = {
      'lat': location.latitude.toStringAsFixed(2),
      'lon': location.longitude.toStringAsFixed(2),
      'appid': 'e81c9dab1b9ac4e037e119341b1ef133',
      'units': 'metric'
    };
    var url =
        Uri.https('api.openweathermap.org', 'data/2.5/weather', queryParams);

    print(url);

    return Network.getNetworkResponse(url);
  }
}
