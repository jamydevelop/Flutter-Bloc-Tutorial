//import 'dart:nativewrappers/_internal/vm/lib/mirrors_patch.dart';

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductWhishlistButtonClickedEvent>(
        homeProductWhishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  Future<void> homeProductWhishlistButtonClickedEvent(
      HomeProductWhishlistButtonClickedEvent event,
      Emitter<HomeState> emit) async {
    debugPrint("***********************************");
    debugPrint("Home Product Whishlist Clicked!");
  }

  Future<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) async {
    debugPrint("***********************************");
    debugPrint("Home Product Cart Clicked!");
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
