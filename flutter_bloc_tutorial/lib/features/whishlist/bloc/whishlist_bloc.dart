import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_tutorial/data/whishlist_items.dart';
import 'package:flutter_bloc_tutorial/features/home/model/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'whishlist_event.dart';
part 'whishlist_state.dart';

class WhishlistBloc extends Bloc<WhishlistEvent, WhishlistState> {
  WhishlistBloc() : super(WhishlistInitial()) {
    on<WhishlistInitialEvent>(whishlistInitialEvent);
    on<WhishlistRemovedFromWhishlistEvent>(whishlistRemovedFromWhishlistEvent);
  }

  Future<void> whishlistInitialEvent(
      WhishlistInitialEvent event, Emitter<WhishlistState> emit) async {
    emit(WishlistSuccessSate(whishListItems: whishlistItems));
  }

  Future<void> whishlistRemovedFromWhishlistEvent(
      WhishlistRemovedFromWhishlistEvent event,
      Emitter<WhishlistState> emit) async {
    whishlistItems.remove(event.productDataModel);
    emit(WishlistSuccessSate(whishListItems: whishlistItems));
  }
}
