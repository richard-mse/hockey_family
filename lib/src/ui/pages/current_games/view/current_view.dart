
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../constants.dart';
import '../../../../repositories/game_repository.dart';
import '../../../../repositories/models/game_model.dart';
import '../../match_page.dart';
import '../bloc/current_bloc.dart';

part './current_view_initial.dart';
part './current_view_loading.dart';
part './current_view_loaded.dart';
part './current_view_success.dart';
part './current_view_failure.dart';

class CurrentPage extends StatelessWidget {
  const CurrentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentBloc(repository: GameRepository.instance)..add(CurrentInitEvent()),
      child: BlocBuilder<CurrentBloc, CurrentState>(
        builder: (context, CurrentState state) => Scaffold(
          appBar: AppBar(
            title: const Text('Current Page'),
          ),
          body: _getBody(state, context),
        ),
      ),
    );
  }

  Widget _getBody(CurrentState state, BuildContext context) {
    if (state is CurrentInitialState) {
      return const _CurrentViewInitial();
    } else if (state is CurrentLoadingState) {
      return const _CurrentViewLoading();
    } else if (state is CurrentLoadedState) {
      return const _CurrentViewLoaded();
    } else if (state is CurrentSuccessState) {
      return const _CurrentViewSuccess();
    } else if (state is CurrentFailureState) {
      return const _CurrentViewFailure();
    } else {
      return Container(); // Fallback for unexpected states
    }
  }
}
