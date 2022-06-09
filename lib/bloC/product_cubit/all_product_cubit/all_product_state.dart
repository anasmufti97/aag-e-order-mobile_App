part of 'all_product_cubit.dart';

abstract class AllProductState extends Equatable {
  const AllProductState();

  @override
  List<Object> get props => [];
}

class AllProductInitial extends AllProductState {}

class LoadingState extends AllProductState {}

class AllProductsFetchedSuccessfully extends AllProductState {
  final AllProductApiResponse client;

  const AllProductsFetchedSuccessfully(this.client);
}

class FailedToFetchData extends AllProductState {
  final String message;

  const FailedToFetchData(this.message);
}

class GetCartItemSuccessfully extends AllProductState {
  final List<CartData>? data;

  const GetCartItemSuccessfully(this.data);
}
