part of 'connection_status_bloc.dart';

abstract class ConnectionStatusState extends Equatable {
  const ConnectionStatusState();

  @override
  List<Object> get props => [];
}

class ConnectionStatusInitial extends ConnectionStatusState {}

class ConnectionStatusInternetIsOn extends ConnectionStatusState {}

class ConnectionStatusInternetIsOff extends ConnectionStatusState {}
