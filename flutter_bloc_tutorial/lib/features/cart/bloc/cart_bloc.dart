import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_tutorial/data/car_items.dart';
import 'package:flutter_bloc_tutorial/features/home/model/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
  }

  Future<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartSuccessState(cartItems: cartItems));
  }
}
