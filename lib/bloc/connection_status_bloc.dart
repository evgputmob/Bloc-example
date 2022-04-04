import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import '../services/connectivity_service.dart';

part 'connection_status_event.dart';
part 'connection_status_state.dart';

class ConnectionStatusBloc
    extends Bloc<ConnectionStatusEvent, ConnectionStatusState> {
  final _connectivityService = ConnectivityService();

  ConnectionStatusBloc() : super(ConnectionStatusInitial()) {
    _init();

    on<ConnectionStatusOff>((event, emit) {
      emit(ConnectionStatusInternetIsOff());
    });

    on<ConnectionStatusOn>((event, emit) {
      emit(ConnectionStatusInternetIsOn());
    });
  }

  Future _init() async {
    final _status = await _connectivityService.getCurrentStatus();
    if (_status == ConnectivityResult.none) {
      add(ConnectionStatusOff());
    } else {
      add(ConnectionStatusOn());
    }
    // Подписываемся на поток событий от сервиса
    _connectivityService.connectionStatusController.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        add(ConnectionStatusOff());
      } else {
        add(ConnectionStatusOn());
      }
    });
  }
}
