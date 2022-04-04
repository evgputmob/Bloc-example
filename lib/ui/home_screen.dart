import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/activity_bloc.dart';
import '../bloc/connection_status_bloc.dart';
import 'widgets/activity_content.dart';
import 'widgets/refresh_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ActivityBloc>(
          create: (context) => ActivityBloc(), // ..add(ActivityRequested()),
          lazy: false,
        ),
        BlocProvider<ConnectionStatusBloc>(
          create: (context) => ConnectionStatusBloc(),
          lazy: false,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Activities for bored people')),
        body: const ActivityContent(),
        floatingActionButton: const RefreshButton(),
      ),
    );
  }
}
