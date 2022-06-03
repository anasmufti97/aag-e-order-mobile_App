part of 'add_category_cubit.dart';

abstract class AddCategoryState extends Equatable {
  const AddCategoryState();

  @override
  List<Object> get props => [];
}

class AddCategoryInitial extends AddCategoryState {}

class LoadingState extends AddCategoryState {}

class AddCategorySuccessfully extends AddCategoryState {
  final String message;

  const AddCategorySuccessfully(this.message);
}

class FailedToAddClient extends AddCategoryState {
  final String message;

  const FailedToAddClient(this.message);
}
