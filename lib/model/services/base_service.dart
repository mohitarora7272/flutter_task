import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class BaseService {
  final String baseUrl = dotenv.env['BASE_URL']!;

  Future<dynamic> getBusinessList(String location);

  Future<dynamic> getBusinessDetails(String id);
}