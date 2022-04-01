part of 'activity_bloc.dart';

abstract class ActivityState extends Equatable {
  const ActivityState();

  @override
  List<Object> get props => [];
}

class ActivityInitial extends ActivityState {}

class ActivityLoadInProgress extends ActivityState {}

class ActivityLoadSuccess extends ActivityState {
  final BoredActivity activity;

  const ActivityLoadSuccess({required this.activity});

  @override
  List<Object> get props => [activity];
}

class ActivityLoadFailure extends ActivityState {
  final String errorMessage;

  const ActivityLoadFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
