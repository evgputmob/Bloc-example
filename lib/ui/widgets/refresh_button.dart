import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/activity_bloc.dart';
import '../../bloc/connection_status_bloc.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _connectionState = context.watch<ConnectionStatusBloc>().state;
    final _activityState = context.watch<ActivityBloc>().state;

    Color _colorByState() {
      if (_connectionState is ConnectionStatusInternetIsOff) {
        return Colors.red.shade200;
      }
      if (_activityState is ActivityLoadInProgress) {
        return Colors.grey.shade400;
      }
      return Colors.blue;
    }

    Icon _iconByState() {
      return (_connectionState is ConnectionStatusInternetIsOff)
          ? const Icon(Icons.cancel)
          : const Icon(Icons.refresh);
    }

    void Function()? _onPressedByState() {
      if ((_connectionState is ConnectionStatusInternetIsOff) ||
          (_activityState is ActivityLoadInProgress)) {
        return null;
      }
      return () => context.read<ActivityBloc>().add(ActivityRequested());
    }

    return FloatingActionButton(
      onPressed: _onPressedByState(),
      child: _iconByState(),
      backgroundColor: _colorByState(),
    );
  }
}
