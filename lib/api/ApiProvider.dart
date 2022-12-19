// ignore_for_file: unused_import

import 'package:application2/model/response_model.dart';
// ignore: implementation_imports
import 'package:flutter/src/foundation/key.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProvider {
  const ApiProvider();

  static Future<ResponseModel> getWeatherData(
      {required String location}) async {
    ResponseModel weatherData = ResponseModel();
    try {
      String url =
          'http://api.weatherapi.com/v1/forecast.json?key=40fc420f369e4a67a1771835222107&q=London&days=1&aqi=no&alerts=no';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        weatherData = ResponseModel.fromJson(data);
       // print(weatherData.current!.cloud);

        //  print('------------response : $data');
      } else {
        print('something went wrong');
      }
    } catch (e) {
      throw e.toString();
    }

    return weatherData;
  }
}
