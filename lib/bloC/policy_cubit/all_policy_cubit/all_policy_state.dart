part of 'all_policy_cubit.dart';

abstract class AllPolicyState extends Equatable {
  const AllPolicyState();

  @override
  List<Object> get props => [];
}

class AllPolicyInitial extends AllPolicyState {}

class LoadingState extends AllPolicyState {}

class AllPolicyFetchedSuccessfully extends AllPolicyState {
  final List<Policy>? policy;

  const AllPolicyFetchedSuccessfully(this.policy);
}

class FailedToFetchData extends AllPolicyState {
  final String message;

  const FailedToFetchData(this.message);
}
