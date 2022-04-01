import 'package:activities/models/bored_activity.dart';
import 'package:activities/services/bored_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final _boredService = BoredService();

  ActivityBloc() : super(ActivityInitial()) {
    on<ActivityRequested>((event, emit) async {
      emit(ActivityLoadInProgress());
      try {
        final _activity = await _boredService.getBoredActivity();
        emit(ActivityLoadSuccess(activity: _activity));
      } catch (e) {
        emit(ActivityLoadFailure(errorMessage: e.toString()));
      }
    });
  }
}
