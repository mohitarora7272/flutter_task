import 'package:flutter/material.dart';
import 'package:flutter_task/model/get_business_details.dart';
import 'package:flutter_task/view_model/business_details_view_model.dart';
import 'package:provider/provider.dart';

import '../../model/apis/api_response.dart';
import '../widgets/business_details_widget.dart';

class HomeDetailScreen extends StatefulWidget {
  final String id;

  const HomeDetailScreen({super.key, required this.id});

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  Widget getBusinessDetailWidget(
      BuildContext context, ApiResponse apiResponse) {
    GetBusinessDetails? businessDetails =
        apiResponse.data as GetBusinessDetails?;
    switch (apiResponse.status) {
      case Status.loading:
        return const Center(child: CircularProgressIndicator());
      case Status.completed:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: BusinessDetailsWidget(businessDetails!),
            ),
          ],
        );
      case Status.error:
        return const Center(
          child: Text('Please try again later!!!'),
        );
      case Status.initial:
      default:
        return const Center(
          child: Text('Search the business details'),
        );
    }
  }

  @override
  void initState() {
    super.initState();
    Provider.of<BusinessDetailsViewModel>(context, listen: false)
        .fetchBusinessDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    ApiResponse apiResponse =
        Provider.of<BusinessDetailsViewModel>(context).response;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Business Details',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: getBusinessDetailWidget(context, apiResponse)),
        ],
      ),
    );
  }
}
