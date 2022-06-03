part of 'all_order_cubit.dart';

abstract class AllOrderState extends Equatable {
  const AllOrderState();

  @override
  List<Object> get props => [];
}

class AllOrderInitial extends AllOrderState {}

class LoadingState extends AllOrderState {}

class AllOrderFetchedSuccessfully extends AllOrderState {
  final List<OrderData>? order;

  const AllOrderFetchedSuccessfully(this.order);
}

class FailedToFetchData extends AllOrderState {
  final String message;

  const FailedToFetchData(this.message);
}
