import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial/features/home/model/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  // final List<ProductDataModel> productDataModel;
  final ProductDataModel productDataModel;
  const ProductTileWidget({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(productDataModel.imageUrl)),
            ),
          ),
          Text(productDataModel.name),
          Text(productDataModel.description)
        ],
      ),
    );
  }
}
