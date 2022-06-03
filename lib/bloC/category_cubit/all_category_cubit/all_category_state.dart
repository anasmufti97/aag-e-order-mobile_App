part of 'all_category_cubit.dart';

abstract class AllCategoryState extends Equatable {
  const AllCategoryState();

  @override
  List<Object> get props => [];
}

class AllCategoryInitial extends AllCategoryState {}

class LoadingState extends AllCategoryState {}

class AllCategoryFetchedSuccessfully extends AllCategoryState {
  final List<Category>? category;

  const AllCategoryFetchedSuccessfully(this.category);
}

class FailedToFetchData extends AllCategoryState {
  final String message;

  const FailedToFetchData(this.message);
}

class GetCartItemSuccessfully extends AllCategoryState {
  final List<CartData>? data;

  const GetCartItemSuccessfully(this.data);
}
