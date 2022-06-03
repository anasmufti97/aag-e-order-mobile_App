part of 'all_client_cubit.dart';

abstract class AllClientState extends Equatable {
  const AllClientState();

  @override
  List<Object> get props => [];
}

class AllClientInitial extends AllClientState {}

class LoadingState extends AllClientState {}

class AllClientFetchedSuccessfully extends AllClientState {
  final List<Client>? client;

  const AllClientFetchedSuccessfully(this.client);
}

class FailedToFetchData extends AllClientState {
  final String message;

  const FailedToFetchData(this.message);
}
