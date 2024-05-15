import 'package:flutter_task/model/get_business_details.dart';
import 'package:flutter_task/model/services/base_service.dart';
import 'package:flutter_task/model/services/business_service.dart';

import 'get_business.dart';

class GetBusinessRepository {
  final BaseService _businessService = BusinessService();

  Future<List<Businesses>> fetchBusinessList(String location) async {
    dynamic response = await _businessService.getBusinessList(location);
    final jsonData = response['businesses'] as List;
    List<Businesses> businessList =
        jsonData.map((tagJson) => Businesses.fromJson(tagJson)).toList();
    return businessList;
  }

  Future<GetBusinessDetails> fetchBusinessDetail(String id) async {
    dynamic response = await _businessService.getBusinessDetails(id);
    GetBusinessDetails businessDetails = GetBusinessDetails.fromJson(response);
    return businessDetails;
  }
}
