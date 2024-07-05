import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/api_service.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ApiService apiService;

  CartBloc(this.apiService) : super(CartInitial()) {
    on<LoadCartEvent>((event, emit) async {
      emit(CartLoading());
      try {
        final carts = await apiService.fetchCarts();
        emit(CartLoaded(carts));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    });
  }
}
