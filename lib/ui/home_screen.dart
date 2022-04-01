import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/activity_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityBloc()..add(ActivityRequested()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Activities for bored people'),
        ),
        body: BlocBuilder<ActivityBloc, ActivityState>(
          builder: (context, state) {
            if (state is ActivityLoadInProgress) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ActivityLoadFailure) {
              return Center(child: Text(state.errorMessage));
            }
            if (state is ActivityLoadSuccess) {
              final activity = state.activity;
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
            return Container();
          },
        ),
        floatingActionButton: BlocBuilder<ActivityBloc, ActivityState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: (state is ActivityLoadInProgress)
                  ? null
                  : (() =>
                      context.read<ActivityBloc>().add(ActivityRequested())),
              child: const Icon(Icons.refresh),
              backgroundColor: (state is ActivityLoadInProgress)
                  ? Colors.grey[400]
                  : Colors.blue,
            );
          },
        ),
      ),
    );
  }
}
