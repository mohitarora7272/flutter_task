import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../apis/app_exception.dart';
import 'base_service.dart';

class BusinessService extends BaseService {
  Map<String, String> headers = {
    'accept': 'application/json',
    'Authorization': 'Bearer ${dotenv.env['API_KEY']!}'
  };

  @override
  Future getBusinessList(String location) async {
    dynamic responseJson;
    try {
      final response = await http.get(
          Uri.parse("$baseUrl/businesses/search?location=$location"),
          headers: headers);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getBusinessDetails(String id) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse("$baseUrl/businesses/$id"),
          headers: headers);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
