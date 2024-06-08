import 'package:flutter/material.dart';
import 'package:food_saver/data/network/api.dart';

class SOrderTile extends StatefulWidget {
  const SOrderTile({super.key, required this.data});
  final Map<dynamic, dynamic> data;
  @override
  State<SOrderTile> createState() => _SOrderTileState();
}

class _SOrderTileState extends State<SOrderTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  '${Api.baseUrl2}${widget.data["product_image"]}',
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data["product_name"],
                      style: Theme.of(context).textTheme.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      children: [
                        Text(
                          'quantity:',
                          // widget.data["product_name"],
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          widget.data["quantity"].toString(),
                          // widget.data["product_name"],
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'product ends after :',
                          // widget.data["product_name"],
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          widget.data["product_expire_time_humified"],
                          // widget.data["product_name"],
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'Price:',
                          // widget.data["product_name"],
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          widget.data["product_price"].toString(),
                          // widget.data["product_name"],
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
