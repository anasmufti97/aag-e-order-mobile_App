part of 'dashboard_cubit.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class LoadingState extends DashboardState {}

class UserFetchedSuccessfully extends DashboardState {
  final User user;

  const UserFetchedSuccessfully(this.user);
}

class FailedToFetchData extends DashboardState {
  final String message;

  const FailedToFetchData(this.message);
}

class DashboardGetSuccessfully extends DashboardState {
  final DashboardData dashboardData;

  const DashboardGetSuccessfully(this.dashboardData);
}
