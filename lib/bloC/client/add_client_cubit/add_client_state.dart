part of 'add_client_cubit.dart';

abstract class AddClientState extends Equatable {
  const AddClientState();

  @override
  List<Object> get props => [];
}

class AddClientInitial extends AddClientState {}

class LoadingState extends AddClientState {}

class AddClientSuccessfully extends AddClientState {
  final String message;

  const AddClientSuccessfully(this.message);
}

class FailedToAddClient extends AddClientState {
  final String message;

  const FailedToAddClient(this.message);
}
