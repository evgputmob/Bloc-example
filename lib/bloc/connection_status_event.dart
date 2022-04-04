part of 'connection_status_bloc.dart';

abstract class ConnectionStatusEvent extends Equatable {
  const ConnectionStatusEvent();

  @override
  List<Object> get props => [];
}

class ConnectionStatusOn extends ConnectionStatusEvent {}

class ConnectionStatusOff extends ConnectionStatusEvent {}
