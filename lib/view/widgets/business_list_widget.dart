import 'package:flutter/material.dart';
import 'package:flutter_task/model/get_business.dart';

class BusinessListWidget extends StatefulWidget {
  final List<Businesses> _businessList;
  final Function _function;

  const BusinessListWidget(this._businessList, this._function, {super.key});

  @override
  State<BusinessListWidget> createState() => _BusinessListWidgetState();
}

class _BusinessListWidgetState extends State<BusinessListWidget> {
  Widget _buildItem(Businesses business) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: SizedBox(
              width: 50,
              height: 50,
              child: Image.network(business.imageUrl ?? '', fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    business.name ?? '',
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
                  Text(
                    business.price ?? '',
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    business.rating.toString(),
                    style: const TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: widget._businessList.length,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            Businesses data = widget._businessList[index];
            return InkWell(
              onTap: () {
                if (null != data.name) {
                  widget._function(data);
                }
              },
              child: _buildItem(data),
            );
          },
        ),
      ]),
    );
  }
}
