import 'package:flutter/material.dart';
import 'package:flutter_task/model/get_business_details.dart';

class BusinessDetailsWidget extends StatefulWidget {
  final GetBusinessDetails _businessDetails;

  const BusinessDetailsWidget(this._businessDetails, {super.key});

  @override
  State<BusinessDetailsWidget> createState() => _BusinessDetailsWidgetState();
}

class _BusinessDetailsWidgetState extends State<BusinessDetailsWidget> {
  Widget _buildItem(GetBusinessDetails business) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: SizedBox(
            width: size.width,
            height: 250,
            child: Image.network(business.imageUrl ?? '', fit: BoxFit.cover),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: ${business.name}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'Alias Name: ${business.alias}',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'Phone Number: ${business.phone}',
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rating: ${business.rating}',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Reviews: ${business.reviewCount}',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    GetBusinessDetails data = widget._businessDetails;
    return SingleChildScrollView(
      child: _buildItem(data),
    );
  }
}
