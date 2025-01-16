part of 'whishlist_bloc.dart';

@immutable
abstract class WhishlistEvent {}

class WhishlistInitialEvent extends WhishlistEvent {}

class WhishlistRemovedFromWhishlistEvent extends WhishlistEvent {
  final ProductDataModel productDataModel;

  WhishlistRemovedFromWhishlistEvent({required this.productDataModel});
}
