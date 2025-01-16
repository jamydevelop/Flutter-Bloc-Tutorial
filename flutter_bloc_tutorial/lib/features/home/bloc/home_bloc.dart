//import 'dart:nativewrappers/_internal/vm/lib/mirrors_patch.dart';

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial/data/car_items.dart';
import 'package:flutter_bloc_tutorial/data/gorcery_data.dart';
import 'package:flutter_bloc_tutorial/data/whishlist_items.dart';
import 'package:flutter_bloc_tutorial/features/home/model/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWhishlistButtonClickedEvent>(
        homeProductWhishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  Future<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  Future<void> homeProductWhishlistButtonClickedEvent(
      HomeProductWhishlistButtonClickedEvent event,
      Emitter<HomeState> emit) async {
    whishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
    debugPrint("***********************************");
    debugPrint("Whishlist Product Clicked!");
  }

  Future<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) async {
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
    debugPrint("***********************************");
    debugPrint("Cart Product Clicked!");
  }

  Future<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) async {
    debugPrint("=====================================");
    debugPrint('Appbar Wishlist! Navigate clicked');
    emit(HomeNavigateToWishlishPageActionState());
    //emit(HomeNavigateToWishlistPageActionState());
  }

  Future<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) async {
    debugPrint("=====================================");
    debugPrint("Appbar Cart! Navigate Clicked");
    emit(HomeNavigateToCartPageActionState());
  }
}
