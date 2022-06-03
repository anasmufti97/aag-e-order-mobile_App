part of 'order_detail_cubit.dart';

abstract class OrderDetailState extends Equatable {
  const OrderDetailState();

  @override
  List<Object> get props => [];
}

class OrderDetailInitial extends OrderDetailState {}

class LoadingState extends OrderDetailState {}

class OrderDataFetchedSuccessfully extends OrderDetailState {
  final OrderData orderData;
  final int? totalPrice;

  const OrderDataFetchedSuccessfully(this.orderData, this.totalPrice);
}

class FailedToFetchData extends OrderDetailState {
  final String message;

  const FailedToFetchData(this.message);
}

class OrderStatusChangeSuccessfully extends OrderDetailState {
  final String message;

  const OrderStatusChangeSuccessfully(this.message);
}

class DeleteOrderProductSuccessfully extends OrderDetailState {
  final String message;

  const DeleteOrderProductSuccessfully(this.message);
}

class FailedToDeleteOrderProduct extends OrderDetailState {
  final String message;

  const FailedToDeleteOrderProduct(this.message);
}
