part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class LoadingState extends CartState {}

class FetchedAllProducts extends CartState {
  final List<CartData>? data;
  final int? totalPrice;

  const FetchedAllProducts(this.data, this.totalPrice);
}

class FailedToFetchedProduct extends CartState {
  final String message;

  const FailedToFetchedProduct(this.message);
}

class UpdateProductQuantity extends CartState {
  final String message;

  const UpdateProductQuantity(this.message);
}

class FailedToChangeQuantity extends CartState {
  final String message;

  const FailedToChangeQuantity(this.message);
}

class DeleteProductSuccessfully extends CartState {
  final String message;

  const DeleteProductSuccessfully(this.message);
}

class FailedToDeleteItem extends CartState {
  final String message;

  const FailedToDeleteItem(this.message);
}

class OrderCreateSuccessfully extends CartState {
  final String message;

  const OrderCreateSuccessfully(this.message);
}

class CreateOrderFailed extends CartState {
  final String message;

  const CreateOrderFailed(this.message);
}
