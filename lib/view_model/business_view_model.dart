import 'package:flutter/cupertino.dart';
import 'package:flutter_task/model/get_business_repository.dart';
import '../model/apis/api_response.dart';
import '../model/get_business.dart';

class BusinessViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  Businesses? _business;

  ApiResponse get response {
    return _apiResponse;
  }

  Businesses? get business {
    return _business;
  }

  /// Call the business service and gets the data of requested business data of
  /// an search.
  Future<void> fetchBusinessData(String value) async {
    _apiResponse = ApiResponse.loading('Fetching business data');
    notifyListeners();
    try {
      List<Businesses> businessList =
          await GetBusinessRepository().fetchBusinessList(value);
      _apiResponse = ApiResponse.completed(businessList);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  void setSelectedBusiness(Businesses? business) {
    _business = business;
    notifyListeners();
  }
}
