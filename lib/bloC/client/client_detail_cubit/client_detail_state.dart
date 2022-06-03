part of 'client_detail_cubit.dart';

abstract class ClientDetailState extends Equatable {
  const ClientDetailState();

  @override
  List<Object> get props => [];
}

class ClientDetailInitial extends ClientDetailState {}

class LoadingState extends ClientDetailState {}

class AddClientSuccessfully extends ClientDetailState {
  final Client client;

  const AddClientSuccessfully(this.client);
}

class FailedToFetchData extends ClientDetailState {
  final String message;

  const FailedToFetchData(this.message);
}
