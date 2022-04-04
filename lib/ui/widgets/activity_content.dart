import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/activity_bloc.dart';
import '../../bloc/connection_status_bloc.dart';

class ActivityContent extends StatelessWidget {
  const ActivityContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final connectionState = context.watch<ConnectionStatusBloc>().state;
    final activityState = context.watch<ActivityBloc>().state;

    if (connectionState is ConnectionStatusInitial) {
      // пока ничего не делаем, т.к. непонятен статус соединения
      return Container();
    }
    if (connectionState is ConnectionStatusInternetIsOn) {
      if (activityState is ActivityInitial) {
        // посылаем запрос, т.к. запрос ещё ни разу не посылался
        context.read<ActivityBloc>().add(ActivityRequested());
        return Container();
      }
      if (activityState is ActivityLoadInProgress) {
        return const Center(child: CircularProgressIndicator());
      }
      if (activityState is ActivityLoadFailure) {
        return Center(child: Text(activityState.errorMessage));
      }
      if (activityState is ActivityLoadSuccess) {
        final activity = activityState.activity;
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('type: ${activity.type}'),
              Text(activity.name),
              Text('participants: ${activity.participants.toString()}'),
            ],
          ),
        );
      }
    } else if (connectionState is ConnectionStatusInternetIsOff) {
      return const Center(
        child: Text(
          'Internet connection is lost',
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    // just for linter :)
    return Container();
  }
}
