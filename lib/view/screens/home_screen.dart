import 'package:flutter/material.dart';
import 'package:flutter_task/model/get_business.dart';
import 'package:flutter_task/view/widgets/business_list_widget.dart';
import 'package:flutter_task/view_model/business_view_model.dart';
import 'package:provider/provider.dart';

import '../../model/apis/api_response.dart';
import 'home_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget getBusinessWidget(BuildContext context, ApiResponse apiResponse) {
    List<Businesses>? businessList = apiResponse.data as List<Businesses>?;
    switch (apiResponse.status) {
      case Status.loading:
        return const Center(child: CircularProgressIndicator());
      case Status.completed:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 8,
              child: BusinessListWidget(businessList!, (Businesses business) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetailScreen(id: business.id!)),
                );
              }),
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
          child: Text('Search the business list by location'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputController = TextEditingController();
    ApiResponse apiResponse = Provider.of<BusinessViewModel>(context).response;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Business List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withAlpha(50),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: TextField(
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        controller: inputController,
                        onChanged: (value) {},
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            Provider.of<BusinessViewModel>(context,
                                    listen: false)
                                .setSelectedBusiness(null);
                            Provider.of<BusinessViewModel>(context,
                                    listen: false)
                                .fetchBusinessData(value);
                          }
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            hintText: 'Enter Location',
                            hintStyle: TextStyle(color: Colors.black))),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: getBusinessWidget(context, apiResponse)),
        ],
      ),
    );
  }
}
