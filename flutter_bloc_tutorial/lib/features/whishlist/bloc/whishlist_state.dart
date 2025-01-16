part of 'whishlist_bloc.dart';

@immutable
abstract class WhishlistState {}

abstract class WhishlistActionState extends WhishlistState {}

class WhishlistInitial extends WhishlistState {}

class WishlistSuccessSate extends WhishlistState {
  final List<ProductDataModel> whishListItems;

  WishlistSuccessSate({required this.whishListItems});
}
