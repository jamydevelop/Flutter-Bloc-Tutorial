// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial/features/home/model/home_product_data_model.dart';
import 'package:flutter_bloc_tutorial/features/whishlist/bloc/whishlist_bloc.dart';

class WhishlistTileWidget extends StatelessWidget {
  // final List<ProductDataModel> productDataModel;
  final ProductDataModel productDataModel;
  final WhishlistBloc whishListBloc;
  const WhishlistTileWidget({
    super.key,
    required this.productDataModel,
    required this.whishListBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(productDataModel.imageUrl)),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            productDataModel.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(productDataModel.description),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ " "${productDataModel.price}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                      color: Colors.black,
                      onPressed: () {
                        // cartBloc.add(HomeProductWhishlistButtonClickedEvent(
                        //     clickedProduct: productDataModel));
                      },
                      icon: Icon(Icons.favorite_border_outlined)),
                  IconButton(
                      color: Colors.black,
                      onPressed: () {
                        whishListBloc.add(WhishlistRemovedFromWhishlistEvent(
                            productDataModel: productDataModel));
                      },
                      icon: Icon(Icons.shopping_bag))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
