// ignore_for_file: void_checks

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/api_service.dart';
import 'product_event.dart';
import 'product_state.dart';
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ApiService apiService;

  ProductBloc(this.apiService) : super(ProductInitial()) {
    on<LoadProductsEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await ApiService.fetchItems();
        emit(ProductLoaded(products: products));
      } catch (e) {
        emit(ProductError(message: e.toString()));
      }
    });
  }
}

