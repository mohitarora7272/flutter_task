import 'package:flutter/cupertino.dart';
import 'package:flutter_task/model/get_business_details.dart';
import 'package:flutter_task/model/get_business_repository.dart';

import '../model/apis/api_response.dart';

class BusinessDetailsViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  GetBusinessDetails? _businessDetails;

  ApiResponse get response {
    return _apiResponse;
  }

  GetBusinessDetails? get businessDetails {
    return _businessDetails;
  }

  /// Call the business details service and gets the data of requested business data of
  /// an search.
  Future<void> fetchBusinessDetails(String id) async {
    _apiResponse = ApiResponse.loading('Fetching business details data');
    try {
      GetBusinessDetails businessDetails =
          await GetBusinessRepository().fetchBusinessDetail(id);
      _apiResponse = ApiResponse.completed(businessDetails);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  void setSelectedBusinessDetails(GetBusinessDetails? businessDetails) {
    _businessDetails = businessDetails;
    notifyListeners();
  }
}
